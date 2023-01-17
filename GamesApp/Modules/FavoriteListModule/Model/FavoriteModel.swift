//
//  FavoriteModel.swift
//  GamesApp
//
//  Created by rasit on 17.01.2023.
//

import Foundation
protocol FavoriteModelProtocol : AnyObject {
    func didFetchFavorites()
}
class FavoriteModel {
    var games: [GamesEntity]?
    weak var delegate: FavoriteModelProtocol?
    
    func getFavoriteList() {
        CoreDataManager.shared.retrieveFromCoreData { result in
            switch result {
            case .success(let games):
                self.games = games
                self.delegate?.didFetchFavorites()
                print(games)
            case .failure(let error):
                print(error)
            }
        }
    }
}
