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
    
    private var tableAdapter: GamesTableViewAdapter!
    private let viewModel = GamesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindGames()
        viewModel.didViewLoad()
        searchBar.delegate = self
    }

    func setupUI() {
        tableAdapter = .init(tableView: tableView, viewModel: viewModel)
    }
    
    func bindGames() {
        viewModel.reloadDelegate = self
    }

    @IBAction func filterButtonClicked(_ sender: Any) {
    }
}

extension GamesViewController: ReloadProtocol {
    func reloadData(games: [GamesResult]) {
        tableAdapter.setTableView(games: games)
    }
}

extension GamesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 3 {
            viewModel.query = searchText
        } else if searchText.count == 0 {
            viewModel.query = ""
        }
    }
}
