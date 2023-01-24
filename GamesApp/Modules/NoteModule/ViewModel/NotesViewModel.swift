//
//  NotesViewModel.swift
//  GamesApp
//
//  Created by rasit on 22.01.2023.
//

import Foundation
// MARK: - Protocol
protocol ReloadNotesProtocol: AnyObject {
    func reloadNotes(notes: [NoteEntity])
}
class NotesViewModel {
    // MARK: - Variables
    private let model = NotesModel()
    weak var reloadDelegate: ReloadNotesProtocol?
    
    // MARK: - Init
    init() {
        model.delegate = self
    }

    // MARK: - DidViewLoad
    func didViewLoad(id: Int) {
        model.getNoteList(id: id)
    }
}
// MARK: - Delegate
extension NotesViewModel: NotesModelProtocol {
    func didFetchNotes() {
        self.reloadDelegate?.reloadNotes(notes: model.notes)
    }
}
