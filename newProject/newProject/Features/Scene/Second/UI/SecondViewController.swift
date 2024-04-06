//
//  SecondViewController.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var secondView: SecondViewScreen = {
        SecondViewScreen()
    }()
    
    var coordinator: SecondCoordinator?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.delegateModal = self
        configNavigation()
    }
    
    override func loadView() {
        view = secondView
    }
    
    private func setupVC() {
        secondView.setupView()
    }
    
    // MARK: - Configurantion
    private func configNavigation() {
        navigationItem.title = "Second Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem?.title = "Voltar"
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
}

extension SecondViewController: SecondViewScreenProtocol {
    func tappedModalButton() {
//        coordinator?.start()
        let modalVC = ModalViewController()
        navigationController?.present(modalVC, animated: true, completion: nil)
    }
    
}
