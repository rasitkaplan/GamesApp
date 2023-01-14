//
//  GamesMdel.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation

protocol GamesModelProtocol : AnyObject {
    func didFetchGames()
}
class GamesModel {
    private(set) var games: [GamesResult] = []
    weak var delegate: GamesModelProtocol?
    
    func fetchGames() {
        NetworkManager.request(type: GamesApiModel.self, url: NetworkHelper.shared.gamesURL, method: .get, parameters: NetworkHelper.shared.gamesParameters) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let games):
                self.games = games.results ?? []
                self.delegate?.didFetchGames()
            case .failure(let error):
                print(error)
            }
        }
    }
}
