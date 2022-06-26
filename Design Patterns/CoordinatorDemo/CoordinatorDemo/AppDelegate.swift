//
//  AppDelegate.swift
//  CoordinatorDemo
//
//  Created by 徐浩博 on 2022/6/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navVC = UINavigationController()
        
        let mainCoordinator = MainCoordinator()
        mainCoordinator.navigationController = navVC

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        self.window = window

        mainCoordinator.start()
        
        return true
    }
}

