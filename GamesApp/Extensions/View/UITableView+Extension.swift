//
//  UITableView+Extension.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
import UIKit
public extension UITableView {
    func registerCells(_ cells: [UITableViewCell.Type]) {
        for cell in cells {
            register(nibFromClass(cell), forCellReuseIdentifier: cell.nameOfClass)
        }
    }

    fileprivate func nibFromClass(_ type: UIView.Type) -> UINib {
        return UINib(nibName: type.nameOfClass, bundle: nil)
    }

    func showEmptyLabel(message: String, containerView: UIView) {
        DispatchQueue.main.async {
            let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: containerView.bounds.size.width, height: containerView.bounds.size.height))
            messageLabel.text = message
            messageLabel.textColor = UIColor.lightGray
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.sizeToFit()

            self.backgroundView = messageLabel
            self.separatorStyle = .none
        }
    }

    func hideTableViewEmptyMessage() {
        DispatchQueue.main.async {
            self.backgroundView = UIView()
        }
    }
}
