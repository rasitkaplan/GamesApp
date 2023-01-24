//
//  NotesViewController.swift
//  GamesApp
//
//  Created by rasit on 22.01.2023.
//

import UIKit

class NotesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variables
    private let viewModel = NotesViewModel()
    private var tableAdapter: NoteTableViewAdapter!
    var notesList: [NoteEntity]?
    var gameName: String = ""
    var id: Int = 0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindNotes()
        setupTableView()
        viewModel.didViewLoad(id: id)
    }
}

//MARK: - Button Action
extension NotesViewController {
    @objc func addTapped() {
        let vc = AddNoteViewController()
        vc.delegate = self
        vc.gameName = gameName
        vc.id = id
        self.present(vc, animated: true)
    }
}

// MARK: - Setup And Bind
extension NotesViewController {
    private func bindNotes() {
        viewModel.reloadDelegate = self
    }
    
    func setupTableView() {
        tableAdapter = .init(tableView: tableView, viewModel: viewModel)
    }
}

// MARK: - Delegates
extension NotesViewController: ReloadNotesProtocol {
    func reloadNotes(notes: [NoteEntity]) {
        tableAdapter.setTableView(noteList: notes)
    }
}

extension NotesViewController: AddedNoteProtocol {
    func reloadNotes() {
        viewModel.didViewLoad(id: id)
    }
}
