//
//  GamesDetailViewModel.swift
//  GamesApp
//
//  Created by rasit on 16.01.2023.
//

import Foundation
protocol SendGameProtocol: AnyObject {
    func sendGame(game: GamesResult)
}

protocol FavoriteProtocol: AnyObject {
    func changeFavorite()
}
class GamesDetailViewModel {
    var game: GamesResult?
    var isFavorite: Bool = false {
        didSet {
            favoriteDelegate?.changeFavorite()
        }
    }
    weak var sendDelegate: SendGameProtocol?
    weak var favoriteDelegate: FavoriteProtocol?
    func didViewLoad() {
    }
    
    func getCacheData() {
        CoreDataManager.shared.retrieveFromCoreData { result in
            switch result {
            case .success(let games):
                for fav in games {
                    if fav.id == self.game?.id ?? 0 {
                        self.isFavorite = true
                        return
                    } else {
                        self.isFavorite = false
                    }
                }
                print(games)
            case .failure(let error):
                print(error)
            }
        }
    }
}
