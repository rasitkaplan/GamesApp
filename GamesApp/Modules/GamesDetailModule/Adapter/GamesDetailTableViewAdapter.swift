//
//  GamesDetailTableViewAdapter.swift
//  GamesApp
//
//  Created by rasit on 16.01.2023.
//

import Foundation
import UIKit
class GamesDetailTableViewAdapter: NSObject {
    var tableView: UITableView!
    private weak var viewModel: GamesDetailViewModel?

    init(tableView: UITableView, viewModel: GamesDetailViewModel) {
        self.tableView = tableView
         self.viewModel = viewModel
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCells([NoteCell.self])
    }
}

extension GamesDetailTableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.nameOfClass, for: indexPath) as! NoteCell
        cell.noteTextView.text = "Test Deneme 1=2"
        return cell
    }
}
