//
//  ViewController.swift
//  newProject
//
//  Created by Kleiton Mendes on 29/03/24.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Private Properties
    private lazy var homeView: HomeViewScreen = {
        HomeViewScreen()
    }()
    
    private let viewModel: HomeViewModelProtocol
    
    // MARK: Construtor
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.delegate = self
        configNavigation()
    }
    
    override func loadView() {
        view = homeView
    }
    
}

extension HomeViewController {
    // MARK: - Private func
    
    private func setupVC() {
        homeView.setupView()
    }
    
    private func configNavigation() {
        navigationItem.title = "Home Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension HomeViewController: HomeViewScreenProtocol {
    func tappedNextButton() {
        viewModel.openSecondView()
    }
    
}
