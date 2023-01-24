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
        setTabBar()
    }
    
    // MARK: - SetTabBar
    private func setTabBar() {
        let gameListViewController = GamesViewController()
        let favoriteListViewController = FavoriteListViewController()
        let allNotesViewController = AllNotesViewController()
        
        self.setViewControllers([gameListViewController, favoriteListViewController , allNotesViewController], animated: true)
        
        guard let items = self.tabBar.items else {return}
        
        let images = ["house", "heart" , "note.text.badge.plus"]
        for x in 0...2 {
            items[x].image = UIImage(systemName: images[x])
        }
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }
}
