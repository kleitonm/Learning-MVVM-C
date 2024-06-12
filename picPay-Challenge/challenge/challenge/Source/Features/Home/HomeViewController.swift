//
//  HomeViewController.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = {
        HomeView()
    }()
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        homeView.delegate = self
    }
    
    @objc func tappedButton(sender: UIButton) {
        let receiptVC = ReceiptViewController()
        navigationController?.pushViewController(receiptVC, animated: true)
    }
    
    private func setupVC() {
        view.backgroundColor = .white
        homeView.setupView()
    }
    
}

extension HomeViewController: HomeProtocol {
    func didTappedButton() {
        let receiptVC = ReceiptViewController()
        navigationController?.pushViewController(receiptVC, animated: true)
    }
}
