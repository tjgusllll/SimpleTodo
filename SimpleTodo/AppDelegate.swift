//
//  AppDelegate.swift
//  SimpleTodo
//
//  Created by 조서현 on 2019. 4. 27..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupKeyWindow()
        return true
    }
    
}

extension AppDelegate {
    private func setupKeyWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let allTodoListController = ProvideObject.allTodoList.viewController
        let navigationController = UINavigationController(rootViewController: allTodoListController)
        
        //navigationController.navigationBar.barTintColor = .black
        //navigationController.navigationBar.tintColor = .white
        
        window?.rootViewController = navigationController
        window?.backgroundColor = .black
        window?.makeKeyAndVisible()
    }
}

