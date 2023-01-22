//
//  NotesViewController.swift
//  GamesApp
//
//  Created by rasit on 22.01.2023.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = NotesViewModel()
    var notesList: [NoteEntity]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCells([NoteCell.self])
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

    }
    
    @objc func addTapped() {
        let vc = AddNoteViewController()
        vc.delegate = self
        self.present(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindNotes()
        viewModel.didViewLoad()
    }
    
    private func bindNotes() {
        viewModel.reloadDelegate = self
    }
}

extension NotesViewController: ReloadNotesProtocol {
    func reloadNotes(notes: [NoteEntity]) {
        self.notesList = notes
        tableView.reloadData()
    }
}

extension NotesViewController: AddedNoteProtocol {
    func reloadNotes() {
        viewModel.didViewLoad()
    }
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.nameOfClass, for: indexPath) as! NoteCell
        if let notes = notesList?[indexPath.row] {
            cell.setCell(notes: notes)
        }
        return cell
    }
}

