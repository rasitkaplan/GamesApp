//
//  ImageCell.swift
//  GamesApp
//
//  Created by rasit on 16.01.2023.
//

import UIKit
import Kingfisher
class ImageCell: UICollectionViewCell {

    @IBOutlet weak var gameImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        gameImageView.layer.cornerRadius = 8
    }
    
    func setCell(url: String) {
        gameImageView.kf.setImage(with: URL(string: url))
    }
}
