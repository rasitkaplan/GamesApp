//
//  GamesDetailViewController.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import UIKit
import Kingfisher
class GamesDetailViewController: UIViewController {

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
    @IBOutlet private weak var noteLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!

    var games: GamesResult? {
        didSet {
            if let game = games {
                viewModel.game = game

            }
        }
    }
    var viewModel = GamesDetailViewModel()
    private var tableAdapter: GamesDetailTableViewAdapter!
    private var collectionViewAdapter: GamesDetailCollectionViewAdapter?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setupTableViewAdapter()
        setupCollectionViewAdapter()
//        tableView.showEmptyLabel(message: "Notunuz yok", containerView: tableView)
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
        
    }
    
    private func setupTableViewAdapter() {
        tableAdapter = .init(tableView: tableView, viewModel: viewModel)
    }
    
    private func setupCollectionViewAdapter() {
        collectionViewAdapter = .init(collectionView: collectionView, viewModel: viewModel)
    }

    @IBAction func addNoteClicked(_ sender: Any) {
    }
    
    @IBAction func addFavoriteClicked(_ sender: Any) {
    }
}
