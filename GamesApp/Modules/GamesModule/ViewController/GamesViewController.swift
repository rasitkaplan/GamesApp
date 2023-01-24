//
//  GamesViewController.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import UIKit

class GamesViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var toolbar: UIToolbar!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var pickerHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    private var tableAdapter: GamesTableViewAdapter!
    private var pickerAdapter: GamesPickerViewAdapter!
    private let viewModel = GamesViewModel()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Games"
        setupTableView()
        bindGames()
        viewModel.didViewLoad()
        searchBar.delegate = self
    }
}

// MARK: - Button Actions
extension GamesViewController {
    @IBAction func cancelButtonClicked(_ sender: UIBarButtonItem) {
        pickerView.endEditing(true)
        pickerHeightConstraint.constant = 0
        pickerView.isHidden = true
        toolbar.isHidden = true
    }

    @IBAction func filterButtonClicked(_ sender: Any) {
        setupPickerView()
    }
}

//MARK: - Setup Functions
extension GamesViewController {
    func setupTableView() {
        tableAdapter = .init(tableView: tableView, viewModel: viewModel)
        tableAdapter.navigationDelegate = self
    }

    func setupPickerView() {
        pickerAdapter = .init(pickerView: pickerView, viewModel: viewModel)
        pickerView.isHidden = false
        toolbar.isHidden = false
        pickerHeightConstraint.constant = 200
    }
}

// MARK: - Bind Games
extension GamesViewController {
    func bindGames() {
        viewModel.stateDelegate = self
        viewModel.reloadDelegate = self
    }
}

// MARK: - Delegates
extension GamesViewController: ReloadProtocol {
    func reloadData(games: [GamesResult]) {
        viewModel.state = .success
        tableAdapter.setTableView(games: games)
    }
}

// MARK: - Loading State Protocol
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
                self.alert(message: error.localizedDescription)
                debugPrint(error)
            }
        }
    }
}

// MARK: - SearchBar
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

// MARK: - Navigation
extension GamesViewController: NavigationProtocol {
    func navigateDetail(games: GamesResult) {
        let vc = GamesDetailViewController()
        vc.games = games
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
