//
//  AppCoordinator.swift
//  newProjetcII
//
//  Created by Kleiton Mendes on 12/05/24.
//

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    func start()
    var navigationController: UINavigationController { get set }
}


class AppCoordinator: AppCoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let coordinator = OneCoordinator(navigationController: navigationController)
        var oneViewController = OneViewController(coordinator: coordinator)
        navigationController.pushViewController(oneViewController, animated: true)
    }
}
