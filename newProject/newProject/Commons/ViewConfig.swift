//
//  ViewConfig.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

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
