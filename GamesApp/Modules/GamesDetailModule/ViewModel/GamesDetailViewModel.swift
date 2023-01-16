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
class GamesDetailViewModel {
    var game: GamesResult?
    weak var sendDelegate: SendGameProtocol?

    func didViewLoad() {

    }
}
