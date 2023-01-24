//
//  GamesTableViewAdapter.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
import UIKit

// MARK: - Protocols
protocol NavigationProtocol: NSObject {
    func navigateDetail(games: GamesResult)
}

class GamesTableViewAdapter: NSObject {
    // MARK: - Outlets
    private var tableView: UITableView?
    private weak var viewModel: GamesViewModel?
    
    // MARK: - Variables
    private var games: [GamesResult] = [] {
        didSet {
            if games.count == 0 {
                self.tableView?.showEmptyLabel(message: "Sonuc bulunamadi", containerView: self.tableView!)
            } else {
                self.tableView?.hideTableViewEmptyMessage()
            }
        }
    }
    weak var navigationDelegate: NavigationProtocol?

    // MARK: - Init
    init(tableView: UITableView, viewModel: GamesViewModel) {
      self.tableView = tableView
      self.viewModel = viewModel
      super.init()
      
      setupTableView()
    }
}

// MARK: Setup Functions
extension GamesTableViewAdapter {
    private func setupTableView() {
      tableView?.registerCells([GamesCell.self])
      tableView?.delegate = self
      tableView?.dataSource = self
    }

    func setTableView(games: [GamesResult]) {
        self.games = games
        tableView?.reloadData()
    }
}
// MARK: - TableView Functions
extension GamesTableViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationDelegate?.navigateDetail(games: self.games[indexPath.row])
    }
}

extension GamesTableViewAdapter: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return games.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: GamesCell.nameOfClass) as! GamesCell
      cell.setCell(games: games[indexPath.row])
      return cell
  }
}
