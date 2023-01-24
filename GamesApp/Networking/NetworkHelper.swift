//
//  NetworkHelper.swift
//  GamesApp
//
//  Created by rasit on 14.01.2023.
//

import Foundation
import Alamofire
enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum ErrorTypes: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Invalid URL"
    case unknownError = "An error unknown"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    let gamesURL = "https://api.rawg.io/api/games"
    let apiKey = "3fb74f844d8a4b4d997fc93f9e849fec"
}
