//
//  Double+Extensions.swift
//  GamesApp
//
//  Created by rasit on 16.01.2023.
//

import Foundation
extension Double {
    // MARK: - Convert Double to String
   var toString: String {
      return NSNumber(value: self).stringValue
   }
}
