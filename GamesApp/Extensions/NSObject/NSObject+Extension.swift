//
//  NSObject+Extension.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
