//
//  ReceiptTableViewCell.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

import UIKit

protocol CellDelegate: AnyObject {
    func didTappedFavoriteButton()
}

class ReceiptTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: ReceiptTableViewCell.self)
    weak var delegate: CellDelegate?
    var favoriteButtonAction: (() -> Void)?
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            contentStackView, amountStackView
        ])
        stack.axis = .horizontal
        stack.spacing = 30
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titleLabel, nameLabel, amountLabel, dateLabel
        ])
        stack.axis = .vertical
        stack.spacing = 3
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.grayType
        label.font = .systemFont(ofSize: 11, weight: .light)
        label.isAccessibilityElement = true
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.blackType
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.isAccessibilityElement = true
        return label
    }()
    
    private lazy var amountStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            amountLabel
        ])
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.blackType
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.isAccessibilityElement = true
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.grayType
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.isAccessibilityElement = true
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureLayout(receipt: Receipt) {
        titleLabel.text = receipt.title
        nameLabel.text = receipt.receiverName
        amountLabel.text = receipt.amount
        dateLabel.text = receipt.date
    }
    
}
    

// MARK: - ViewCodeImplementation
extension ReceiptTableViewCell: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(containerStackView)
    }
    
    func setupConstraints() {
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -padding),
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -padding)
        ])
    }
}

