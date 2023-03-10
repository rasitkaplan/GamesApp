//
//  ViewState.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
// MARK: - View State Enum
enum ViewState {
    case idle
    case loading
    case success
    case error(Error)
}
