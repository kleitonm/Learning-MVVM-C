//
//  ReceiptView.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

import UIKit

protocol ReceiptViewDelegate: AnyObject {
    func favoriteTapped()
}

class ReceiptView: UIView {
    
    private var dataModel: DataModel?
    private var receiptsModel: [ReceiptModel] = []
    weak var delegate: ReceiptViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupLoading()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    lazy var  loadingRecipts: LoadingReceipts = {
        let vw = LoadingReceipts()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    lazy var emptyListView: EmptyReceiptView = {
        let view = EmptyReceiptView(frame: .zero)
        view.backgroundColor = .systemBackground
        view.isHidden = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Listagem de Comprovante"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .orange
        titleLabel.font = .systemFont(ofSize: 24.0, weight: .bold)
        titleLabel.isAccessibilityElement = true
        titleLabel.accessibilityLabel = "Listagem de Comprovante"
        titleLabel.accessibilityTraits = .header
        return titleLabel
    }()
    
    lazy var receiptTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.backgroundColor = .clear
        tableView.isHidden = true
        tableView.register(ReceiptTableViewCell.self, forCellReuseIdentifier: ReceiptTableViewCell.identifier)
        tableView.separatorStyle = .singleLine
        tableView.isAccessibilityElement = true
        return tableView
    }()
    
    func setupLoading() {
        loadingRecipts.startLoading()
    }
    
}

// MARK: - ViewCodeImplementation
extension ReceiptView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(loadingRecipts)
        addSubview(receiptTableView)
        addSubview(emptyListView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([

            loadingRecipts.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            loadingRecipts.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            loadingRecipts.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            loadingRecipts.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            receiptTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            receiptTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            receiptTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            receiptTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            emptyListView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            emptyListView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emptyListView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emptyListView.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
    }
    
    func setupStyle() {
        emptyListView.isHidden = true
        backgroundColor = .systemBackground
        receiptTableView.accessibilityIdentifier = "receiptTableView"
    }
}

extension ReceiptView: CellDelegate {
    func didTappedFavoriteButton() {
        delegate?.favoriteTapped()
    }
    
}
