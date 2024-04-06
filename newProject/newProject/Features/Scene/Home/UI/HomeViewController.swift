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
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.delegate = self
    }
    
    override func loadView() {
        view = homeView
    }
    
    private func setupVC() {
        homeView.setupView()
    }

}

extension HomeViewController: HomeViewScreenProtocol {
    func tappedNextButton() {
//        let secondVC = SecondViewController()
//        navigationController?.pushViewController(secondVC, animated: true)
    }
    
}
