//
//  OneCoordinator.swift
//  newProjetcII
//
//  Created by Kleiton Mendes on 12/05/24.
//

import UIKit

enum OneActions {
    case secondScreen
}

protocol OneCoordinatorProtocol: AnyObject {
    func navigate(to view: OneActions)
}

class OneCoordinator: AppCoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let coordinator = OneCoordinator(navigationController: navigationController)
        let oneController = OneViewController(coordinator: coordinator)
        oneController.coordinator = self
        navigationController.pushViewController(oneController, animated: true)
    }
}

extension OneCoordinator: OneCoordinatorProtocol {
    func navigate(to view: OneActions) {
        switch view {
        case .secondScreen:
            let second = TwoFactory.make(navigationController)
            navigationController.pushViewController(second, animated: true)
        }
    }
    
    
}
