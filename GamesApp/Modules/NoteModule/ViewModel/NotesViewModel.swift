//
//  NotesViewModel.swift
//  GamesApp
//
//  Created by rasit on 22.01.2023.
//

import Foundation
protocol ReloadNotesProtocol: AnyObject {
    func reloadNotes(notes: [NoteEntity])
}
class NotesViewModel {
    private let model = NotesModel()
    weak var reloadDelegate: ReloadNotesProtocol?
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.getNoteList()
    }
}

extension NotesViewModel: NotesModelProtocol {
    func didFetchNotes() {
        self.reloadDelegate?.reloadNotes(notes: model.notes ?? [])
    }
}
