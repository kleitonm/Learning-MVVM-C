//
//  SecondScreenCoordinator.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

class SecondCoordinator: AppCoordinator {
    
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let modalVC = ModalViewController()
//        modalVC.coordinator = self
        navigation.present(modalVC, animated: true, completion: nil)
    }
    
}
