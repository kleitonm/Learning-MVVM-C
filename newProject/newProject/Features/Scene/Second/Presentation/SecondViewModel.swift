//
//  SecondViewModel.swift
//  newProject
//
//  Created by Kleiton Mendes on 10/04/24.
//

import Foundation

protocol SecondViewModelProtocol {
    func doSometing()
}

class SecondViewModel {
 
    private let coordinator: SecondCoordinatorProtocol
    
    init(coordinator: SecondCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

extension SecondViewModel: SecondViewModelProtocol {
    func doSometing() {
        coordinator.navigate(to: .modal)
    }
}
