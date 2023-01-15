//
//  GamesCell.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import UIKit
import Kingfisher
class GamesCell: UITableViewCell {

    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell(games: GamesResult) {
        nameLabel?.text = games.name ?? ""
        ratingLabel.text = "\(games.rating ?? 0.0)"
        gameImageView.kf.setImage(with: URL(string: games.backgroundImage ?? ""))
    }
}
