//
//  GamesMdel.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
import Alamofire
protocol GamesModelProtocol : AnyObject {
    func didFetchGames()
}
class GamesModel {
    private(set) var games: [GamesResult] = []
    weak var delegate: GamesModelProtocol?
    
    func fetchGames(isSearch: Bool = false, query: String = "", isFilter: Bool = false, filter: String = "") {
        var parameters: Parameters = ["key" : "3fb74f844d8a4b4d997fc93f9e849fec"]
        if isSearch {
            parameters = [
                "key": "3fb74f844d8a4b4d997fc93f9e849fec",
                "search": query
            ]
        } else if isFilter {
            parameters = [
                "key": "3fb74f844d8a4b4d997fc93f9e849fec",
                "ordering": "-\(filter)"
            ]
        }
        NetworkManager.request(type: GamesApiModel.self, url: NetworkHelper.shared.gamesURL, method: .get, parameters: parameters) { [weak self] response in
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
