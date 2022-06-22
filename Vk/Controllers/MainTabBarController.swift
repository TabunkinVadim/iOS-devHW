//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Табункин Вадим on 27.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    let  loginVC: UIViewController
    let feedVC: UIViewController

    init (loginCheker: LoginInspector,checkModel: CheckModel ){
        loginVC = LogInViewController(loginCheker: loginCheker )
        feedVC = FeedViewController(checkModel: checkModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        let feedViewController = createNavController(viewController: feedVC, itemName: "Newsline", itemImage: "newspaper")
        let profileViewController = createNavController(viewController: loginVC, itemName: "Profile", itemImage: "person")
        viewControllers = [profileViewController, feedViewController]
    }
    
    func createNavController(viewController:UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0 )
        
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10 )
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        return navController
    }
}

