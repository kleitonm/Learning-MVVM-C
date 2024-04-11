//
//  SecondViewModel.swift
//  newProject
//
//  Created by Kleiton Mendes on 10/04/24.
//

import Foundation

protocol SecondViewModelProtocol {
    func openModalView()
}

final class SecondViewModel {
 
    private let coordinator: SecondCoordinatorProtocol
    
    init(coordinator: SecondCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

extension SecondViewModel: SecondViewModelProtocol {
    func openModalView() {
        coordinator.navigate(to: .modal)
    }
}
