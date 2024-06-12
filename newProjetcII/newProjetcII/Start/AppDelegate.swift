//
//  AppDelegate.swift
//  newProjetcII
//
//  Created by Kleiton Mendes on 12/05/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.coordinateSpace.bounds)
        window?.makeKeyAndVisible()
        
        let navigation = UINavigationController()
//        var controller = OneViewController(coordinator: )
        window?.rootViewController = navigation
    
        let coordinator = OneCoordinator(navigationController: navigation)
        coordinator.navigate(to: .secondScreen)
        
        return true
    }
}

