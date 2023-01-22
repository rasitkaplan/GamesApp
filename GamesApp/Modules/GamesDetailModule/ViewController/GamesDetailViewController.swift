//
//  GamesDetailViewController.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import UIKit
import Kingfisher
import UserNotifications
class GamesDetailViewController: UIViewController {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var cornerView: UIView!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var bigImageView: UIImageView!
    @IBOutlet private weak var smallView: UIView!
    @IBOutlet private weak var smallImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!
    @IBOutlet private weak var addedLabel: UILabel!
    @IBOutlet private weak var noteButton: UIButton!
    @IBOutlet private weak var favoriteButton: UIButton!

    var games: GamesResult? {
        didSet {
            if let game = games {
                viewModel.game = game

            }
        }
    }

    var viewModel = GamesDetailViewModel()
    private var collectionViewAdapter: GamesDetailCollectionViewAdapter?

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        self.viewModel.favoriteDelegate = self
        self.viewModel.getCacheData()
        setUI()
        setupCollectionViewAdapter()
    }
    
    func setUI() {
        smallView.layer.cornerRadius = smallView.frame.height / 2
        cornerView.clipsToBounds = true
        cornerView.layer.cornerRadius = 20
        cornerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        smallImageView.layer.cornerRadius = 8
        favoriteButton.layer.cornerRadius = 8
        noteButton.layer.cornerRadius = 8
        
        
        ratingLabel.text = games?.rating?.toString
        bigImageView.kf.setImage(with: URL(string: games?.backgroundImage ?? ""))
        smallImageView.kf.setImage(with: URL(string: games?.backgroundImage ?? ""))
        nameLabel.text = games?.name
        genreLabel.text = games?.genres?[0].name
        addedLabel.text = "\(games?.added ?? 0)"
        cornerView.isHidden = false
        bigImageView.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    private func setupCollectionViewAdapter() {
        collectionViewAdapter = .init(collectionView: collectionView, viewModel: viewModel)
    }

    @IBAction func addNoteClicked(_ sender: Any) {
        let vc = NotesViewController()
        vc.gameName = games?.name ?? ""
        vc.id = games?.id ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addFavoriteClicked(_ sender: Any) {
        if viewModel.isFavorite == false {
            if let game = games {
                CoreDataManager.shared.addFavorite(model: game)
                self.viewModel.isFavorite = true
            }
        } else {
            if let game = games {
                CoreDataManager.shared.deleteFavorites(game: game)
                self.viewModel.isFavorite = false
                self.viewModel.getCacheData()
            }
        }

    }
}


extension GamesDetailViewController: FavoriteProtocol {
    func changeFavorite() {
        if self.viewModel.isFavorite {
            self.favoriteButton.setTitle("Favorilerden cikart", for: .normal)
            self.favoriteButton.setNeedsLayout()
        } else {
            self.favoriteButton.setTitle("Favorilere Ekle", for: .normal)
        }
    }
}
