//
//  SecondViewController.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

final class SecondViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var secondView: SecondViewScreen = {
        SecondViewScreen()
    }()
    
    private let viewModel: SecondViewModelProtocol
    
    // MARK: Construtor
    init(viewModel: SecondViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.delegateModal = self
        configNavigation()
    }
    
    override func loadView() {
        view = secondView
    } 
    
}

extension SecondViewController {
    // MARK: - Private func
    private func setupVC() {
        secondView.setupView()
    }
    
    private func configNavigation() {
        navigationItem.title = "Second Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem?.title = "Voltar"
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
}

extension SecondViewController: SecondViewScreenProtocol {
    func tappedModalButton() {
        viewModel.openModalView()
    }
    
}
