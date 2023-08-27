//
//  UIKitDiscountView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 02/06/23.
//

import UIKit

final class UIKitDiscountView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var discountLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup(discountPercentage: String) {
        discountLabel.text = "\(discountPercentage) off"
        setupView()
    }
    
    func prepareForReuse() {
        discountLabel.text = ""
    }
}

extension UIKitDiscountView: ViewCode {
    func setupViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(discountLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            discountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            discountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            discountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            discountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
