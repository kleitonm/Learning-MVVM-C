//
//  SceneDelegate.swift
//  newProjetcII
//
//  Created by Kleiton Mendes on 12/05/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navigation = UINavigationController()
            let coordinator = OneCoordinator(navigationController: navigation)
            window.rootViewController = UINavigationController(rootViewController: OneViewController(coordinator: coordinator))
            self.window = window
            window.makeKeyAndVisible()
            
        }
    }
}

