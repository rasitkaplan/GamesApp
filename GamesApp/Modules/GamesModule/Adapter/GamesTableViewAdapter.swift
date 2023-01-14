//
//  GamesTableViewAdapter.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
import UIKit
class GamesTableViewAdapter: NSObject {
    private var tableView: UITableView?
    private weak var viewModel: GamesViewModel?

    init(tableView: UITableView, viewModel: GamesViewModel) {
      self.tableView = tableView
      self.viewModel = viewModel
      super.init()
      
      setupTableView()
    }

    private func setupTableView() {
      tableView?.registerCells([GamesCell.self])
      tableView?.delegate = self
      tableView?.dataSource = self
    }
}

extension GamesTableViewAdapter: UITableViewDelegate {}

extension GamesTableViewAdapter: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: GamesCell.nameOfClass) as! GamesCell
    return cell
  }
}
