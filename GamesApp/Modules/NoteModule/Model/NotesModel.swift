//
//  NotesModel.swift
//  GamesApp
//
//  Created by rasit on 22.01.2023.
//

import Foundation
protocol NotesModelProtocol : AnyObject {
    func didFetchNotes()
}
class NotesModel {
    var notes: [NoteEntity]?
    weak var delegate: NotesModelProtocol?
    
    func getNoteList() {
        CoreDataManager.shared.getNotes { result in
            switch result {
            case .success(let notes):
                self.notes = notes
                self.delegate?.didFetchNotes()
                print(notes)
            case .failure(let error):
                print(error)
            }
        }
    }
}
