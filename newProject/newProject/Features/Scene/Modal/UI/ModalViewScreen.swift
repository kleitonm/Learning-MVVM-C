//
//  ModalViewScreen.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

final class ModalViewScreen: UIView {
    
    private lazy var backgroundImagem: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "spider-image")
        return img
    }()
    
    // MARK: Construtor
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
