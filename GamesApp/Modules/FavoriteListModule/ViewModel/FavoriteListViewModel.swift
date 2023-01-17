//
//  FavoriteListViewModel.swift
//  GamesApp
//
//  Created by rasit on 17.01.2023.
//

import Foundation
protocol ReloadFavoriteProtocol: AnyObject {
    func reloadFavorite(games: [GamesEntity])
}
class FavoriteListViewModel {
    private let model = FavoriteModel()
    weak var reloadDelegate: ReloadFavoriteProtocol?
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.getFavoriteList()
    }
}

extension FavoriteListViewModel: FavoriteModelProtocol {
    func didFetchFavorites() {
        self.reloadDelegate?.reloadFavorite(games: model.games ?? [])
    }
}
