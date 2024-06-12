//
//  ViewController.swift
//  newProjetcII
//
//  Created by Kleiton Mendes on 12/05/24.
//

import UIKit
import SwiftUI

class OneViewController: UIViewController {

    weak var coordinator: OneCoordinatorProtocol?
    
    // MARK: Construtor
    init(coordinator: OneCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "One Screen"
        setupView()
    }
    
    private lazy var image: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "image-one")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
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
//        coordinator?.navigate(to: .secondScreen)
        var twoCoordinator: TwoCoordinatorProtocol?
        let twoController = TwoScreenViewController(coordinator: twoCoordinator!)
        navigationController?.pushViewController(twoController, animated: true)
    }
    

}

extension OneViewController: ViewConfig {
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
struct OneViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> OneViewController {
        var coordinator = OneCoordinator(navigationController: .init())
        return OneViewController(coordinator: coordinator)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    typealias UIViewControllerType = OneViewController
}

struct ListContactsViewControllerPreview: PreviewProvider {
    static var previews: some View {
        OneViewControllerPreview()
    }
}
