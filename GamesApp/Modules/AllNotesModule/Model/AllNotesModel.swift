//
//  AllNotesModel.swift
//  GamesApp
//
//  Created by rasit on 23.01.2023.
//

import Foundation
// MARK: - Protocol
protocol AllNotesModelProtocol : AnyObject {
    func didFetchAllNotes()
}
class AllNotesModel {
    // MARK: - Variables
    var notes: [NoteEntity]?
    weak var delegate: AllNotesModelProtocol?
    
    // MARK: - Get All Notes From Cache
    func getAllNotesList() {
        CoreDataManager.shared.getNotes { result in
            switch result {
            case .success(let notes):
                self.notes = notes
                self.delegate?.didFetchAllNotes()
            case .failure(let error):
                print(error)
            }
        }
    }
}
