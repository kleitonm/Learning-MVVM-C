//
//  ModalViewController.swift
//  newProject
//
//  Created by Kleiton Mendes on 06/04/24.
//

import UIKit

final class ModalViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var modalView: ModalViewScreen = {
        ModalViewScreen()
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = modalView
    }
    
    private func setupVC() {
        modalView.setupView()
    }
}
