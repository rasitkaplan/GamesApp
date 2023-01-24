//
//  AllNotesViewModel.swift
//  GamesApp
//
//  Created by rasit on 23.01.2023.
//

import Foundation
// MARK: - Protocol
protocol ReloadAllNotesProtocol: AnyObject {
    func reloadAllNotes(notes: [NoteEntity])
}
class AllNotesListViewModel {
    // MARK: - Variables
    private let model = AllNotesModel()
    weak var reloadAllNotDelegate: ReloadAllNotesProtocol?
    
    // MARK: - Init
    init() {
        model.delegate = self
    }
    
    // MARK: - DidViewLoad
    func didViewLoad() {
        model.getAllNotesList()
    }
}
// MARK: - Delegate
extension AllNotesListViewModel: AllNotesModelProtocol {
    func didFetchAllNotes() {
        self.reloadAllNotDelegate?.reloadAllNotes(notes: model.notes ?? [])
    }
}
