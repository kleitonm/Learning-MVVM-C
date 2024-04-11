//
//  HomeViewScreen.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

protocol HomeViewScreenProtocol: AnyObject {
    func tappedNextButton()
}

final class HomeViewScreen: UIView {
    
    weak var delegate: HomeViewScreenProtocol?
    
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .yellow
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("START", for: .normal)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc func buttonTapped() {
        delegate?.tappedNextButton()
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

extension HomeViewScreen: ViewConfig {
    func buildHierarchy() {
        addSubview(startButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([

            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            startButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .red
    }
    
}
