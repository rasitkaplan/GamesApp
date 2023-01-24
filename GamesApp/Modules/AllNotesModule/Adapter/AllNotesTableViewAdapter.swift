//
//  AllNotesAdapter.swift
//  GamesApp
//
//  Created by rasit on 24.01.2023.
//

import Foundation
import UIKit
class AllNotesTableViewAdapter: NSObject {
    // MARK: - Outlets
    var tableView: UITableView!
    
    // MARK: - Variables
    private weak var viewModel: AllNotesListViewModel?
    var noteList: [NoteEntity]? {
        didSet {
            if noteList?.count == 0 {
                tableView.showEmptyLabel(message: "No Comments", containerView: tableView)
            } else {
                tableView.hideTableViewEmptyMessage()
            }
        }
    }

    // MARK: - Init
    init(tableView: UITableView, viewModel: AllNotesListViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        setupTableView()
    }
}

// MARK: - Setup
extension AllNotesTableViewAdapter {
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCells([NoteCell.self])
    }
    
    func setTableView(noteList: [NoteEntity]) {
        self.noteList = noteList
        tableView?.reloadData()
    }
}
// MARK: - TableView Functions
extension AllNotesTableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.nameOfClass, for: indexPath) as! NoteCell
        if let note = noteList?[indexPath.row] {
            cell.setCell(notes: note)
        }
        return cell
    }
}
