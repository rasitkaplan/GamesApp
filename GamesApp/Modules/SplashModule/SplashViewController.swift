//
//  SplashViewController.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// Splash ekranında giriş resmi gözüktükten 2 saniye sonra TabBarController'ın açılmasını sağlıyor.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = TabBarController()
            self.navigationController?.setViewControllers([vc], animated: true)
        }
    }
}
