//
//  AllNotesViewController.swift
//  GamesApp
//
//  Created by rasit on 23.01.2023.
//

import UIKit

class AllNotesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    private let viewModel = AllNotesListViewModel()
    private var tableAdapter: AllNotesTableViewAdapter!
    var allNotesList: [NoteEntity]?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "All Notes"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindAllNotes()
        setupTableView()
        viewModel.didViewLoad()
    }
    

}
// MARK: - Bind And Setup
extension AllNotesViewController {
    private func bindAllNotes() {
        viewModel.reloadAllNotDelegate = self
    }
    
    func setupTableView() {
        tableAdapter = .init(tableView: tableView, viewModel: viewModel)
    }
}
// MARK: - Delegate
extension AllNotesViewController: ReloadAllNotesProtocol {
    func reloadAllNotes(notes: [NoteEntity]) {
        tableAdapter.setTableView(noteList: notes)
    }
}

