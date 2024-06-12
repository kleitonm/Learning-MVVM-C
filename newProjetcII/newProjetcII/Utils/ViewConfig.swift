//
//  ViewConfig.swift
//  newProjetcII
//
//  Created by Kleiton Mendes on 12/05/24.
//

import Foundation

protocol ViewConfig {
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

extension ViewConfig {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    func applyAdditionalChanges() { }
}
