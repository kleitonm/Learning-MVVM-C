//
//  SecondViewScreen.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

protocol SecondViewScreenProtocol: AnyObject {
    func tappedModalButton()
}

class SecondViewScreen: UIView {
    
    weak var delegateModal: SecondViewScreenProtocol?
    
    private lazy var modalButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Modal", for: .normal)
        btn.addTarget(self, action: #selector(modalTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc func modalTapped() {
        delegateModal?.tappedModalButton()
    }
    
}

extension SecondViewScreen: ViewConfig {
    func buildHierarchy() {
        addSubview(modalButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([

            modalButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            modalButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            modalButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            modalButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            modalButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .yellow
    }
    
}
