//
//  FavoriteListViewModel.swift
//  GamesApp
//
//  Created by rasit on 17.01.2023.
//

import Foundation
// MARK: - Protocol
protocol ReloadFavoriteProtocol: AnyObject {
    func reloadFavorite(favorites: [GamesEntity])
}
class FavoriteListViewModel {
    // MARK: - Variables
    private let model = FavoriteModel()
    weak var reloadDelegate: ReloadFavoriteProtocol?

    // MARK: - Init
    init() {
        model.delegate = self
    }
    // MARK: - DidViewLoad
    func didViewLoad() {
        model.getFavoriteList()
    }
}
// MARK: - Protocols
extension FavoriteListViewModel: FavoriteModelProtocol {
    func didFetchFavorites() {
        self.reloadDelegate?.reloadFavorite(favorites: model.favorites ?? [])
    }
}
