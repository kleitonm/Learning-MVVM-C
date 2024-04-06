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
    
    private func configNavigation() {
        navigationItem.title = "Second Screen"
        navigationItem.leftBarButtonItem?.title = "Voltar"
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
}

extension SecondViewController: SecondViewScreenProtocol {
    func tappedModalButton() {
//                let modalVC = ModalViewController()
        //        navigationController?.pushViewController(modalVC, animated: true)
    }
    
}
