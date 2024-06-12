//
//  ViewCodeProtocol.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

import Foundation

protocol ViewCodeProtocol {
    func buildHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}

extension ViewCodeProtocol {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    func applyAdditionalChanges() { }
}
