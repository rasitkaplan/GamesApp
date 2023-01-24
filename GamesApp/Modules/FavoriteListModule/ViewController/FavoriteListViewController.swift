//
//  FavoriteListViewController.swift
//  GamesApp
//
//  Created by rasit on 17.01.2023.
//

import UIKit

class FavoriteListViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    private let viewModel = FavoriteListViewModel()
    var favoriteList: [GamesEntity]?
    private var tableAdapter: FavoritesTableViewAdapter!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindFavorite()
        setupTableView()
        viewModel.didViewLoad()
    }
}

// MARK: - Bind and Setup
extension FavoriteListViewController {
    private func bindFavorite() {
        viewModel.reloadDelegate = self
    }

    func setupTableView() {
        tableAdapter = .init(tableView: tableView, viewModel: viewModel)
    }
}
extension FavoriteListViewController: ReloadFavoriteProtocol {
    func reloadFavorite(favorites: [GamesEntity]) {
        tableAdapter.setTableView(favoriteList: favorites)
    }
}
