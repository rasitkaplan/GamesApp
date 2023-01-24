//
//  UIViewController+Extensions.swift
//  GamesApp
//
//  Created by rasit on 22.01.2023.
//

import Foundation
import UIKit
extension UIViewController {
    // MARK: - Show Alert
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
