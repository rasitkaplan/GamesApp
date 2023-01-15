//
//  DatabaseError.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
enum DatabaseError: Error {
    case failedToSaveData
    case failedToFetchData
    case failedToDeleteData
}
