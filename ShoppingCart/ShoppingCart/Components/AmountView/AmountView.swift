//
//  AmountView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 02/06/23.
//

import UIKit

final class AmountView: UIView {
    
    private lazy var iconImageView: UIImageView = {
        let image = UIImage(systemName: "tag.square")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var priceContentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var actualPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var regularPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont(12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setup(regularPrice: String, actualPrice: String, onSale: Bool) {
        actualPriceLabel.text = actualPrice
        regularPriceLabel.isHidden = !onSale
        if onSale {
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: regularPrice)
            attributeString.addAttribute(
                NSAttributedString.Key.strikethroughStyle,
                value: 2,
                range: NSRange(location: 0, length: attributeString.length)
            )
            regularPriceLabel.attributedText = attributeString
        }
        setupView()
    }
    
    func prepareForReuse() {
        actualPriceLabel.text = ""
        regularPriceLabel.text = ""
    }
}

extension AmountView: ViewCode {
    func setupViewHierarchy() {
        addSubview(iconImageView)
        addSubview(priceContentStackView)
        priceContentStackView.addArrangedSubview(actualPriceLabel)
        priceContentStackView.addArrangedSubview(regularPriceLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 33),
            iconImageView.heightAnchor.constraint(equalToConstant: 33),
            
            priceContentStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 2),
            priceContentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceContentStackView.heightAnchor.constraint(equalTo: iconImageView.heightAnchor),
            priceContentStackView.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            
            actualPriceLabel.heightAnchor.constraint(equalToConstant: 16),
            
            regularPriceLabel.heightAnchor.constraint(equalToConstant: 14),
        ])
    }
}
