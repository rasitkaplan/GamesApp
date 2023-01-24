//
//  AddNoteViewModel.swift
//  GamesApp
//
//  Created by rasit on 24.01.2023.
//

import Foundation
protocol ReloadAddNoteProtocol: AnyObject {
    func reloadNotes()
}
class AddNoteViewModel {
    private let model = AddNoteModel()
    weak var delegate: ReloadAddNoteProtocol?
    func didViewLoad() {
        model.delegate = self
    }
    func addNote(id: Int, comment: String, star: Int64, gameName: String) {
        model.addNote(id: id, comment: comment, star: star, gameName: gameName)
    }
}

extension AddNoteViewModel: AddNoteModelProtocol {
    func addNote() {
        delegate?.reloadNotes()
    }
}
