//
//  AppDelegate.swift
//  Navigation
//
//  Created by Табункин Вадим on 27.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let loginChecker = LoginInspector()
        let controller = MainTabBarController(loginCheker: loginChecker)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        

        return true
    }
}

