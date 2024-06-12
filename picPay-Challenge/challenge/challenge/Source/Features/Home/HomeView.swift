//
//  HomeView.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

import UIKit

protocol HomeProtocol: AnyObject {
    func didTappedButton()
}

class HomeView: UIView {
    
    weak var delegate: HomeProtocol?
        
    private lazy var backgroundImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "background-itau")
        img.contentMode = .scaleToFill
        img.isAccessibilityElement = false
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("início", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        btn.backgroundColor = .orange
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: .tappedButton, for: .touchUpInside)
        btn.isAccessibilityElement = true
        btn.accessibilityLabel = "Botão início"
        btn.accessibilityTraits = .button
        return btn
    }()
    
    @objc func tappedButton(sender: UIButton) {
        delegate?.didTappedButton()
        UIAccessibility.post(notification: .announcement, argument: "O botão foi pressionado com sucesso")
    }
}

// MARK: - ViewCodeImplementation
extension HomeView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(backgroundImage)
        addSubview(startButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            startButton.topAnchor.constraint(equalTo: topAnchor, constant: 450),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
