//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Табункин Вадим on 27.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        let feedViewController = createNavController(viewController: FeedViewController(), itemName: "Newsline", itemImage: "newspaper")
        
        let profileViewController = createNavController(viewController: LogInViewController(), itemName: "Profile", itemImage: "person")
        
        viewControllers = [feedViewController, profileViewController]
    }
    
    func createNavController(viewController:UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0 )
        
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10 )
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        return navController
    }
}

