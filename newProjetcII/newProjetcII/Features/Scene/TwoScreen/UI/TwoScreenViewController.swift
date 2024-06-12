//
//  TwoScreenViewController.swift
//  newProjetcII
//
//  Created by Kleiton Mendes on 12/05/24.
//

import UIKit
import SwiftUI

class TwoScreenViewController: UIViewController {
    
    var coordinator: TwoCoordinatorProtocol
    
    // MARK: Construtor
    init(coordinator: TwoCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "image-two")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .yellow
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("Next Three Screen", for: .normal)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc func buttonTapped() {
        let threeController = ThreeScreenViewController()
        navigationController?.pushViewController(threeController, animated: true)
    }
}

extension TwoScreenViewController: ViewConfig {
    func buildHierarchy() {
        view.addSubview(image)
        view.addSubview(startButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: -60),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40),
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            startButton.heightAnchor.constraint(equalToConstant: 40),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    func applyAdditionalChanges() {
        view.backgroundColor = .red
    }
    
}

// MARK - Preview
struct TwoScreenViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> TwoScreenViewController {
        var coordinator = TwoCoordinator(navigation: .init())
        return TwoScreenViewController(coordinator: coordinator)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    typealias UIViewControllerType = TwoScreenViewController
}

struct TwoScreenControllerPreview: PreviewProvider {
    static var previews: some View {
        TwoScreenViewControllerPreview()
    }
}


