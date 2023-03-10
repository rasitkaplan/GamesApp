//
//  GamesDetailCollectionViewAdapter.swift
//  GamesApp
//
//  Created by rasit on 16.01.2023.
//

import Foundation
import UIKit
class GamesDetailCollectionViewAdapter: NSObject {
    // MARK: - Variables
    var collectionView: UICollectionView!
    private weak var viewModel: GamesDetailViewModel?

    // MARK: - Init
    init(collectionView: UICollectionView, viewModel: GamesDetailViewModel) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        super.init()
        setupCollectionView()
    }
 
    // MARK: - Setup ColletionView
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: ImageCell.nameOfClass, bundle: nil), forCellWithReuseIdentifier: ImageCell.nameOfClass)
    }
}

// MARK: - Collection View Functions
extension GamesDetailCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.game?.shortScreenshots?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.nameOfClass, for: indexPath) as! ImageCell
        cell.setCell(url: viewModel?.game?.shortScreenshots?[indexPath.row].image ?? "")
        return cell
    }
}
