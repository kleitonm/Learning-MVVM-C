//
//  TwoFactory.swift
//  newProjetcII
//
//  Created by Kleiton Mendes on 14/05/24.
//

import UIKit

enum TwoFactory {
    
    static func make(_ navigation: UINavigationController) -> UIViewController {
        let coordinator = TwoCoordinator(navigation: navigation)
        let controller = TwoScreenViewController(coordinator: coordinator)
        return controller
    }
}
