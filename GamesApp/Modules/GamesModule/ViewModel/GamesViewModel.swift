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

protocol StateDelegate: AnyObject {
    func didUpdate(with state: ViewState)
}
class GamesViewModel {
    private let model = GamesModel()
    var state: ViewState = .idle{
        didSet {
            self.stateDelegate?.didUpdate(with: state)
        }
    }
    var filterArray = ["released", "added", "created", "updated", "rating"]
    var filter: String = "" {
        didSet {
            model.fetchGames(isFilter: true, filter: filter)
        }
    }
    weak var reloadDelegate: ReloadProtocol?
    weak var stateDelegate: StateDelegate?
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
        self.state = .idle
        model.delegate = self
    }

    func didViewLoad() {
      self.state = .loading
      model.fetchGames()
    }
}

extension GamesViewModel: GamesModelProtocol {
    func didFetchGames() {
        self.reloadDelegate?.reloadData(games: model.games)
    }
}
