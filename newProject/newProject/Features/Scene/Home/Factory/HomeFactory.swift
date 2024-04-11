//
//  HomeFactory.swift
//  newProject
//
//  Created by Kleiton Mendes on 29/03/24.
//

import UIKit

enum HomeFactory {
    
    static func make(_ navigation: UINavigationController) -> UIViewController {
        let coordinator = HomeCoordinator(navigation: navigation)
        let viewModel = HomeViewModel(coordinator: coordinator)
        let controller = HomeViewController(viewModel: viewModel)
        return controller
    }
}
