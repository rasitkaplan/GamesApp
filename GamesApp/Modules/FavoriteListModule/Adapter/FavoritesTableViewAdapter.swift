//
//  FavoritesTableViewAdapter.swift
//  GamesApp
//
//  Created by rasit on 23.01.2023.
//

import Foundation
import UIKit
class FavoritesTableViewAdapter: NSObject {
    // MARK: - Outlets
    var tableView: UITableView!
    private weak var viewModel: FavoriteListViewModel?
    var favoriteList: [GamesEntity]?

    // MARK: - Init
    init(tableView: UITableView, viewModel: FavoriteListViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        setupTableView()
    }
}

// MARK: - Setup
extension FavoritesTableViewAdapter {
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setTableView(favoriteList: [GamesEntity]) {
        self.favoriteList = favoriteList
        self.favoriteList?.reverse()
        tableView?.reloadData()
    }
}
extension FavoritesTableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = favoriteList?[indexPath.row].name ?? ""
        return cell
    }
}
