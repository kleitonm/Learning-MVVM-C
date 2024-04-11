//
//  HomeViewModel.swift
//  newProject
//
//  Created by Kleiton Mendes on 29/03/24.
//

import Foundation

protocol HomeViewModelProtocol {
     func openSecondView()
}

final class HomeViewModel {
    private let coordinator: HomeCoordinatorProtocol
    
    init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func openSecondView() {
        coordinator.navigate(to: .second)
    }

}
