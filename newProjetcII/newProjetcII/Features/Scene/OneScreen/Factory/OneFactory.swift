//
//  OneFactory.swift
//  newProjetcII
//
//  Created by Kleiton Mendes on 12/05/24.
//

import UIKit

enum OneFactory {
    
    static func make(_ navigation: UINavigationController) -> UIViewController {
        let coordinator = OneCoordinator(navigationController: navigation)
        let controller = OneViewController(coordinator: coordinator)
        return controller
    }
}
