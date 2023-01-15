//
//  NetworkManager.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static func request<T: Codable>(type: T.Type, url: String, method: HTTPMethod, parameters: Parameters, completion: @escaping((Result<T, ErrorTypes>) -> ())) {
        
        AF.request(url, method: method, parameters: parameters).response { response in
            switch response.result {
            case .success(let data):
                if let data = data {
                    self.handleResponse(data: data) { response in
                        completion(response)
                    }
                }
  
            case .failure(_):
                completion(.failure(.unknownError))
            }
        }
    }
    
    private static func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>) -> ())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
}
