//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Табункин Вадим on 27.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    weak var coordinator: MainCoordinator?
//    weak var profileCoordinator: ProfileCoordinator?
    
    //    var mainCoordinator = MainCoordinator(navigationController: UINavigationController())
        var profileCoordinator: ProfileCoordinator
        var feedCoordinator: FeedCoordinator

//    let  loginVC: UIViewController
//    let feedVC: UIViewController

    init (loginCheker: LoginInspector,checkModel: CheckModel ){
        profileCoordinator = MainCoordinator.shared.profile(navigationController: UINavigationController(), loginCheker: loginCheker)
        feedCoordinator = MainCoordinator.shared.feed(navigationController: UINavigationController(), checkModel: checkModel)
//        profileCoordinator = ProfileCoordinator(navigationController: UINavigationController(), loginCheker: loginCheker)
//        feedCoordinator = FeedCoordinator(navigationController: UINavigationController(), checkModel: checkModel)

//        feedCoordinator = coordinator?.childCoordinators[1] as! FeedCoordinator

//        loginVC = LogInViewController(loginCheker: loginCheker )
//        feedVC = FeedViewController(checkModel: checkModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        profileCoordinator.start()
//        feedCoordinator.start()
        viewControllers = [profileCoordinator.navigationController, feedCoordinator.navigationController]
//            coordinator?.childCoordinators[0].navigationController, coordinator?.childCoordinators[1].navigationController]
//        setupTabBar()
    }
    
//    func setupTabBar() {
//
//        let feedViewController = createNavController(viewController: feedVC, itemName: "Newsline", itemImage: "newspaper")
//        let profileViewController = createNavController(viewController: loginVC, itemName: "Profile", itemImage: "person")
//        viewControllers = [profileViewController, feedViewController]
//    }
//
//    func createNavController(viewController:UIViewController, itemName: String, itemImage: String) -> UINavigationController {
//
//        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0 )
//
//        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10 )
//
//        let navController = UINavigationController(rootViewController: viewController)
//        navController.tabBarItem = item
//        return navController
//    }
}

