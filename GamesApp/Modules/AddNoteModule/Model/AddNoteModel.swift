//
//  AddNoteModel.swift
//  GamesApp
//
//  Created by rasit on 24.01.2023.
//

import Foundation
protocol AddNoteModelProtocol: AnyObject {
    func addNote()
}
class AddNoteModel {
    // MARK: - Variables
    weak var delegate: AddNoteModelProtocol?
    
    // MARK: - Get Data From Cache
    func addNote(id: Int, comment: String, star: Int64, gameName: String) {
        CoreDataManager.shared.addNote(id: id, comment: comment, star: star, gameName: gameName)
        delegate?.addNote()
    }
}
