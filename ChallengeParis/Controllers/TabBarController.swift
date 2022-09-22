//
//  TabBarController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 13/09/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //teste
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTabBarController()
    }

    private func setupTabBarController() {
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .onboardingPurple
        tabBar.tintColor = .onboardingPurple
    
        guard let items = tabBar.items else { return }
        items[0].title = "Home"
        items[0].image = UIImage(systemName: "house")
        items[0].selectedImage = UIImage(systemName: "house.fill")

        items[1].title = "Jogos"
        items[1].image = UIImage(systemName: "puzzlepiece")
        items[1].selectedImage = UIImage(systemName: "puzzlepiece.fill")


        items[2].title = "Registros"
        items[2].image = UIImage(systemName: "quote.bubble")
        items[2].selectedImage = UIImage(systemName: "quote.bubble.fill")


        items[3].title = "Salvos"
        items[3].image = UIImage(systemName: "bookmark")
        items[3].selectedImage = UIImage(systemName: "bookmark.fill")

        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBar.layer.shadowRadius = 1
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
}
