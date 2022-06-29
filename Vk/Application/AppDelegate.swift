//
//  AppDelegate.swift
//  Navigation
//
//  Created by Табункин Вадим on 27.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: MainCoordinator?
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        let navController = UINavigationController()
        MainCoordinator.shared.start()
//        coordinator = MainCoordinator(navigationController: navController)
//        coordinator?.start()
//        let loginFactory = MyLoginFactory()
//        let checkModel = CheckModel()
//        let controller = MainTabBarController(loginCheker: loginFactory.getLoginChek(),checkModel: checkModel)
        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = controller
        window?.rootViewController = MainCoordinator.shared.navigationController
//            navController

        window?.makeKeyAndVisible()


        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
        return true
    }
}

