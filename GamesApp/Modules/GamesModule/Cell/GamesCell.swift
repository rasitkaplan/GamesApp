//
//  GamesCell.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import UIKit
import Kingfisher
class GamesCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// setCell fonksiyonu ile apiden gelen bilgilerimi gerekli label ve imageView'lara vererek istediğim görünümü elde ediyorum.
    func setCell(games: GamesResult) {
        nameLabel?.text = games.name ?? ""
        ratingLabel.text = "\(games.rating ?? 0.0)"
        gameImageView.layer.cornerRadius = 8
        gameImageView.kf.setImage(with: URL(string: games.backgroundImage ?? ""))
    }
}
