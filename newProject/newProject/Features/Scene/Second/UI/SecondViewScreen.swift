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

final class SecondViewScreen: UIView {
    
    weak var delegateModal: SecondViewScreenProtocol?
    
    private lazy var modalButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Modal", for: .normal)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(modalTapped(sender:)), for: .touchUpInside)
        return btn
    }()
    
    @objc func modalTapped(sender: UIButton) {
        delegateModal?.tappedModalButton()
    }
    
    // MARK: Construtor
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
