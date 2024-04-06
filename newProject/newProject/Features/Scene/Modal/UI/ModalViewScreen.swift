//
//  ModalViewScreen.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

class ModalViewScreen: UIView {
    
    private lazy var backgroundImagem: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "spider-image")
        return img
    }()
}

extension ModalViewScreen: ViewConfig {
    func buildHierarchy() {
        addSubview(backgroundImagem)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImagem.topAnchor.constraint(equalTo: topAnchor),
            backgroundImagem.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImagem.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImagem.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
}
