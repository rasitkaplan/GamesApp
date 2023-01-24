//
//  FavoriteModel.swift
//  GamesApp
//
//  Created by rasit on 17.01.2023.
//

import Foundation
// MARK: - Protocol
protocol FavoriteModelProtocol : AnyObject {
    func didFetchFavorites()
}
class FavoriteModel {
    // MARK: - Variables
    var favorites: [GamesEntity]?
    weak var delegate: FavoriteModelProtocol?
    
    // MARK: - Get Data From Cache
    func getFavoriteList() {
        CoreDataManager.shared.retrieveFromCoreData { result in
            switch result {
            case .success(let favorites):
                self.favorites = favorites
                self.delegate?.didFetchFavorites()
            case .failure(let error):
                print(error)
            }
        }
    }
}
