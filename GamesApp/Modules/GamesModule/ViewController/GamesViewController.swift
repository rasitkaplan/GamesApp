//
//  GamesViewController.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import UIKit

class GamesViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private var tableAdapter: GamesTableViewAdapter!
    private var pickerAdapter: GamesPicketViewAdapter!
    private let viewModel = GamesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindGames()
        viewModel.didViewLoad()
        searchBar.delegate = self
    }

    func setupTableView() {
        tableAdapter = .init(tableView: tableView, viewModel: viewModel)
        tableAdapter.navigationDelegate = self
    }

    func setupPickerView() {
        pickerAdapter = .init(pickerView: pickerView, viewModel: viewModel)
        pickerView.isHidden = false
        pickerHeightConstraint.constant = 200
    }
    
    func bindGames() {
        viewModel.stateDelegate = self
        viewModel.reloadDelegate = self
    }

    @IBAction func filterButtonClicked(_ sender: Any) {
        setupPickerView()
    }
}

extension GamesViewController: ReloadProtocol {
    func reloadData(games: [GamesResult]) {
        viewModel.state = .success
        tableAdapter.setTableView(games: games)
    }
}

extension GamesViewController: StateDelegate {
    func didUpdate(with state: ViewState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch state {
            case .idle:
                break
            case .loading:
                self.activityIndicator.startAnimating()
            case .success:
                self.activityIndicator.stopAnimating()
            case .error(let error):
                self.activityIndicator.stopAnimating()
                debugPrint(error)
            }
        }
    }
}
extension GamesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if searchText.count >= 3 {
                self.viewModel.state = .loading
                self.viewModel.query = searchText
            } else if searchText.count == 0 {
                self.viewModel.state = .loading
                self.viewModel.query = ""
            }
        }
    }
}

extension GamesViewController: NavigationProtocol {
    func navigateDetail(games: GamesResult) {
        let vc = GamesDetailViewController()
        vc.games = games
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
