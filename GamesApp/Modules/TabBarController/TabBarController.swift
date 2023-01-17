//
//  TabBarController.swift
//  GamesApp
//
//  Created by rasit on 17.01.2023.
//

import Foundation
import UIKit
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameListViewController = GamesViewController()
        let favoriteListViewController = FavoriteListViewController()
        
        self.setViewControllers([gameListViewController, favoriteListViewController], animated: true)
        
        guard let items = self.tabBar.items else {return}
        
        let images = ["house", "heart"]
        for x in 0...1 {
            items[x].image = UIImage(systemName: images[x])
        }
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }
}
