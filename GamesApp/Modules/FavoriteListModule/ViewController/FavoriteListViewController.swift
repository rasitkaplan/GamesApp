//
//  FavoriteListViewController.swift
//  GamesApp
//
//  Created by rasit on 17.01.2023.
//

import UIKit

class FavoriteListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = FavoriteListViewModel()
    var favoriteList: [GamesEntity]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print("Favorite DidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindFavorite()
        viewModel.didViewLoad()
    }
    
    private func bindFavorite() {
        viewModel.reloadDelegate = self
    }

}

extension FavoriteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = favoriteList?[indexPath.row].name ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
        }
    }
}

extension FavoriteListViewController: ReloadFavoriteProtocol {
    func reloadFavorite(games: [GamesEntity]) {
        self.favoriteList = games
        self.tableView.reloadData()
    }
}
