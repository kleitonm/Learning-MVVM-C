//
//  SecondScreenFactory.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

enum SecondFactory {
    
    static func make(_ navigation: UINavigationController) -> UIViewController {
        let coordinator = SecondCoordinator(navigation: navigation)
        let viewModel = SecondViewModel(coordinator: coordinator)
        let controller = SecondViewController(viewModel: viewModel)
        return controller
    }
}
