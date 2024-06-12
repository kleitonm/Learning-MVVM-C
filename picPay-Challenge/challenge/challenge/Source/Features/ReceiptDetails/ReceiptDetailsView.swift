//
//  ReceiptDetailsView.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

import UIKit

final class ReceiptDetailsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        containerStackView.isHidden = true
        amountStackView.isHidden = true
        transactionLabel.isHidden = true
        loadingRecipts.startLoading()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var  loadingRecipts: LoadingReceipts = {
        let vw = LoadingReceipts()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
        
    lazy var amountStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            amountValueLabel, amountLabel
        ])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var amountValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Valor R$"
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Valor"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5.000,00"
        label.textColor = UIColor.blackType
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Valor em reais"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    lazy var transactionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Detalhe da Transação"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Detalhe da Transação"
        label.accessibilityTraits = .header
        return label
    }()
    
    lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titleStackView, nameStackView,
            beneficiaryStackView, dateStackView,
            controlStackView, idTransactionStackView
        ])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titleLabel, subTitleLabel
        ])
        stack.spacing = 3
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Título"
        label.textColor = UIColor.grayType
        label.font = UIFont.systemFont(ofSize: 11, weight: .light)
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Titulo"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pagamento de Boleto"
        label.textColor = UIColor.blackType
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            nameTitleLabel, nameLabel
        ])
        stack.spacing = 3
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.textColor = UIColor.grayType
        label.font = UIFont.systemFont(ofSize: 11, weight: .light)
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Nome"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Débora dos Santos"
        label.textColor = UIColor.blackType
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var beneficiaryStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            beneficiaryLabel, nameOfBeneficiaryLabel
        ])
        stack.spacing = 3
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var beneficiaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Favorecido"
        label.textColor = UIColor.grayType
        label.font = UIFont.systemFont(ofSize: 11, weight: .light)
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Nome do Favorecido"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var nameOfBeneficiaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Débora dos Santos"
        label.textColor = UIColor.blackType
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var dateStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            dateTitleLabel, dateLabel
        ])
        stack.spacing = 3
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var dateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data"
        label.textColor = UIColor.grayType
        label.font = UIFont.systemFont(ofSize: 11, weight: .light)
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Data"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "qua, 16 de maio de 2022"
        label.textColor = UIColor.blackType
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var controlStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            controlTitleLabel, controlLabel
        ])
        stack.spacing = 3
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var controlTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Controle"
        label.textColor = UIColor.grayType
        label.font = UIFont.systemFont(ofSize: 11, weight: .light)
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Controle"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var controlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "HDUS36217367127DS"
        label.textColor = UIColor.blackType
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.isAccessibilityElement = true
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var idTransactionStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            idTransactionTitleLabel, idTransactionLabel
        ])
        stack.spacing = 3
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var idTransactionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Id da Transação"
        label.textColor = UIColor.grayType
        label.font = UIFont.systemFont(ofSize: 11, weight: .light)
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Id da Transação"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var idTransactionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4321"
        label.textColor = UIColor.blackType
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    func getDetails(receipt: Receipt) {
        subTitleLabel.text = receipt.title
        nameLabel.text = receipt.receiverName
        amountLabel.text = receipt.amount
        dateLabel.text = receipt.date
        controlLabel.text = receipt.control
        idTransactionLabel.text = receipt.receiptId
    }
    
}

extension ReceiptDetailsView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(loadingRecipts)
        addSubview(amountStackView)
        addSubview(transactionLabel)
        addSubview(containerStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            loadingRecipts.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            loadingRecipts.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            loadingRecipts.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            loadingRecipts.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            amountStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            amountStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            amountStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            amountStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            transactionLabel.topAnchor.constraint(equalTo: amountStackView.bottomAnchor, constant: 20),
            transactionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            transactionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            containerStackView.topAnchor.constraint(equalTo: transactionLabel.bottomAnchor, constant: 20),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
