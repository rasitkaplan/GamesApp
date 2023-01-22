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
    var notes: [NoteEntity] = []
    weak var delegate: NotesModelProtocol?
    
    func getNoteList(id: Int) {
        CoreDataManager.shared.getNotes { result in
            switch result {
            case .success(let notes):
                for note in notes {
                    if note.id == id {
                        self.notes.append(note)
                    }
                }
                self.delegate?.didFetchNotes()
                print(notes)
            case .failure(let error):
                print(error)
            }
        }
    }
}
