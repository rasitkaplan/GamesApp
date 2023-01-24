//
//  NoteCell.swift
//  GamesApp
//
//  Created by rasit on 22.01.2023.
//

import UIKit
import Cosmos
class NoteCell: UITableViewCell {

    // MARK: -  Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    @IBOutlet private weak var starView: CosmosView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Set Cell
    func setCell(notes: NoteEntity) {
        commentLabel.text = notes.comment ?? ""
        starView.rating = Double(notes.star)
        nameLabel.text = notes.gameName
    }
}
