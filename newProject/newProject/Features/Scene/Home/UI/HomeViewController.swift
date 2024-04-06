//
//  ViewController.swift
//  newProject
//
//  Created by Kleiton Mendes on 29/03/24.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Private Properties
    private lazy var homeView: HomeViewScreen = {
        HomeViewScreen()
    }()
    
    var coordinator: HomeCoordinator?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.delegate = self
        configNavigation()
    }
    
    override func loadView() {
        view = homeView
    }
    
    private func setupVC() {
        homeView.setupView()
    }

    // MARK: - Configurantion
    private func configNavigation() {
        navigationItem.title = "Home Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension HomeViewController: HomeViewScreenProtocol {
    func tappedNextButton() {
        coordinator?.start()
    }
    
}
