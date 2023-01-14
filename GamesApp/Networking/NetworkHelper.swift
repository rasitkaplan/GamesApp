//
//  NetworkHelper.swift
//  GamesApp
//
//  Created by rasit on 14.01.2023.
//

import Foundation
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
}
