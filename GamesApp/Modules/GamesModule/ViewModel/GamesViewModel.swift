//
//  GamesViewModel.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
// MARK: - Protocols
protocol ReloadProtocol: AnyObject {
    func reloadData(games: [GamesResult])
}

protocol StateDelegate: AnyObject {
    func didUpdate(with state: ViewState)
}

class GamesViewModel {
    // MARK: - Variables
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
            /// query parametresi boş ise tüm oyunlar için request atılıyor
            if query == "" {
                model.fetchGames()
            } else {
                /// query parametresi boş değil ise isSearch parametresi true olarak set ediliyor ve request kısmına parametre olarak query gönderiliyor
                model.fetchGames(isSearch: true, query: query ?? "")
            }
        }
    }
    // MARK: - Init
    /// ViewModel initiliaze fonksiyonu
    init() {
        self.state = .idle
        model.delegate = self
    }

    /// ViewModel init olduktan sonra ilk çalışmasını istediğim fonksiyon. Model içerisinde ki api request fonksiyonunu burada çalıştırıyorum.
    /// Bu fonksiyon ise viewController içerisinde ki viewDidLoad fonksiyonu içerisinde çağırılıyor.
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
