//
//  SecondScreenCoordinator.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

enum SecondActions {
    case modal
}

protocol SecondCoordinatorProtocol {
    func navigate(to view: SecondActions)
}

final class SecondCoordinator {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
 
}

extension SecondCoordinator: SecondCoordinatorProtocol {
    func navigate(to view: SecondActions) {
        switch view {
        case .modal:
            let modal = ModalFactory.make()
            navigation.present(modal, animated: true)
        }
    }
    
}
