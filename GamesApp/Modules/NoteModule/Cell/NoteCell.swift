//
//  NoteCell.swift
//  GamesApp
//
//  Created by rasit on 22.01.2023.
//

import UIKit
import Cosmos
class NoteCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var starView: CosmosView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(notes: NoteEntity) {
        commentLabel.text = notes.comment ?? ""
        starView.rating = Double(notes.star)
        nameLabel.text = notes.gameName
    }
}
