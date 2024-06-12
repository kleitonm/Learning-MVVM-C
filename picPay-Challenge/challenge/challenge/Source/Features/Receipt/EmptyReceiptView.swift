//
//  EmptyReceiptView.swift
//  Challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

import UIKit

class EmptyReceiptView: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "not-found")
        imageView.contentMode = .scaleAspectFit
        imageView.isAccessibilityElement = true
        imageView.accessibilityLabel = "Imagem de não encontrado"
        imageView.accessibilityTraits = .image
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Não foi encontrado resultados"
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Não foi encontrado resultados"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.text = "Tente uma nova pesquisa"
        label.isAccessibilityElement = true
        label.accessibilityLabel = "Tente uma nova pesquisa"
        label.accessibilityTraits = .staticText
        return label
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

// MARK: - ViewCodeProtocol Extension
extension EmptyReceiptView: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(logo)
        addSubview(title)
        addSubview(subtitle)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 90),
            logo.heightAnchor.constraint(equalToConstant: 90),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 8),
            
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            subtitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
        ])
    }
}
