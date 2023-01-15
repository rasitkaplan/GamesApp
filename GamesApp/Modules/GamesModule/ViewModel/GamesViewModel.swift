//
//  GamesViewModel.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
protocol ReloadProtocol: AnyObject {
    func reloadData(games: [GamesResult])
}
class GamesViewModel {
    private let model = GamesModel()
    weak var reloadDelegate: ReloadProtocol?
    var query: String? {
        didSet {
            if query == "" {
                model.fetchGames()
            } else {
                model.fetchGames(isSearch: true, query: query ?? "")
            }
        }
    }
    init() {
        model.delegate = self
    }

    func didViewLoad() {
      model.fetchGames()
    }
}

extension GamesViewModel: GamesModelProtocol {
    func didFetchGames() {
        self.reloadDelegate?.reloadData(games: model.games)
    }
}
