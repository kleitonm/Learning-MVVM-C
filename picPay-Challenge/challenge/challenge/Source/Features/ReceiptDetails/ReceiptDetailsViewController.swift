//
//  ReceiptDetailsViewController.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//
import UIKit

final class ReceiptDetailsViewController: UIViewController {
    
    private lazy var receiptDetailsViewScreen: ReceiptDetailsView = {
        ReceiptDetailsView()
    }()
    
    private let viewModel = ReceiptsViewModel()
    private var dataModel: DataModel?
    private var receipt: Receipt?
    
    override func loadView() {
        super.loadView()
        view = receiptDetailsViewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        configureNavigation()
        setupLoadingScreen()
    }
    
    init(receipt: Receipt?) {
        self.receipt = receipt
        super.init(nibName: nil, bundle: nil)
        guard let receipt else { return }
        receiptDetailsViewScreen.getDetails(receipt: receipt)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupVC()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupVC() {
        view.backgroundColor = .white
        receiptDetailsViewScreen.setupView()
    }
    
    private func setupLoadingScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.receiptDetailsViewScreen.containerStackView.isHidden = false
            self.receiptDetailsViewScreen.amountStackView.isHidden = false
            self.receiptDetailsViewScreen.transactionLabel.isHidden = false
            self.receiptDetailsViewScreen.loadingRecipts.stopLoading()
        }
    }
}

extension ReceiptDetailsViewController {
    func configureNavigation() {
        let arrowLeftButton = createLeftBarButton(action: .goToReceiptViewController)
        navigationItem.leftBarButtonItem = arrowLeftButton
        arrowLeftButton.isAccessibilityElement = true
        arrowLeftButton.accessibilityLabel = "Voltar"
        arrowLeftButton.accessibilityTraits = .button
    }
    
    @objc func goToReceiptViewController() {
        navigationController?.popViewController(animated: true)
        UIAccessibility.post(notification: .announcement, argument: "O botão foi pressionado com sucesso")
    }
}

// MARK: - ViewCodeImplementation
extension ReceiptDetailsViewController: ViewCodeProtocol {
    func buildHierarchy() {
        view.addSubview(receiptDetailsViewScreen)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            receiptDetailsViewScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            receiptDetailsViewScreen.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
}
