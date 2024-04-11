//
//  HomeCoordinator.swift
//  newProject
//
//  Created by Kleiton Mendes on 29/03/24.
//

import UIKit

enum HomeActions {
    case home
    case second
}

protocol HomeCoordinatorProtocol {
    func navigate(to view: HomeActions)
}

class HomeCoordinator {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func navigate(to view: HomeActions) {
        switch view {
        case .home:
            let home = HomeFactory.make(navigation)
            navigation.pushViewController(home, animated: true)
        case .second:
            let second = SecondFactory.make(navigation)
            navigation.pushViewController(second, animated: true)
        }
    }
    
}
