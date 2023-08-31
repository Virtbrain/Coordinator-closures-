//
//  AppDelegate.swift
//  Coordinator(closures)
//
//  Created by Alexey Manankov on 31.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: Coordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let user = User(name: "Alex Manankov", city: City(name: "Moscow"))
        let navigationController = UINavigationController()
        
        coordinator = Coordinator(user: user, navigationController: navigationController)
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()

       return true
    }


}

