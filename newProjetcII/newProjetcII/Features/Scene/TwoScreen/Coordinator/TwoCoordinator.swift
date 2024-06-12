//
//  TwoCoordinator.swift
//  newProjetcII
//
//  Created by Kleiton Mendes on 14/05/24.
//

import UIKit

enum TwoActions {
    case threeScreen
}

protocol TwoCoordinatorProtocol {
    func navigation(to view: TwoActions)
}

class TwoCoordinator {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}

extension TwoCoordinator: TwoCoordinatorProtocol {
    func navigation(to view: TwoActions) {
        switch view {
        case .threeScreen:
            print("")
        }
    }
    
    
}
