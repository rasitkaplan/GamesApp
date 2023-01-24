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
    
    /// Tüm oyunların api üzerinden çekilmesi için kullanılan fonksiyon.
    func fetchGames(isSearch: Bool = false, query: String = "", isFilter: Bool = false, filter: String = "") {
        var parameters: Parameters = ["key" : NetworkHelper.shared.apiKey]
        /// Eğer request atmak istediğimiz kısım search ise isSearh parametresi true olarak set ediliyor. Filtreleme üzerinden request atmak istediğimiz de ise isFilter değeri true olarak set ediliyor.
        /// Bu ayrıma göre de api'ye gönderilecek parametreler değişiyor.
        if isSearch {
            parameters = [
                "key": NetworkHelper.shared.apiKey,
                "search": query
            ]
        } else if isFilter {
            parameters = [
                "key": NetworkHelper.shared.apiKey,
                "ordering": "-\(filter)"
            ]
        }
        /// Belirtilen parametre ve url'e göre api istediğini yaptığımız fonksiyon.
        NetworkManager.request(type: GamesApiModel.self, url: NetworkHelper.shared.gamesURL, method: .get, parameters: parameters) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let games):
                self.games = games.results ?? []
                ///Gelen response değerini de GameModelProtocol tipinde tanımlanan delegate ile ViewModel'a gönderiyoruz.
                self.delegate?.didFetchGames()
            case .failure(let error):
                print(error)
            }
        }
    }
}
