//
//  ShoppingCartCollectionViewCell.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

import UIKit

final class ShoppingCartCollectionViewCell: UICollectionViewCell {
    static let identifier = "ShoppingCartCollectionViewCell"
    
    // MARK: - Properties
    private lazy var imagePlaceholder: UIImage? = {
        let config = UIImage.SymbolConfiguration(font: .defaultFont(50), scale: .large)
        return UIImage(systemName: "tshirt", withConfiguration: config)
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = imagePlaceholder
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont(16)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sizeAndPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var quantityView: QuantityView = {
        let view = QuantityView(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setup(cartproduct: CartProduct) {
        imageView.loadImage(from: cartproduct.product.image)
        quantityView.update(cartproduct.quantity)
        let sizeAndPrice = "\(cartproduct.size.size) - \(cartproduct.product.actualPrice)"
        sizeAndPriceLabel.text = sizeAndPrice
        nameLabel.text = cartproduct.product.name
        setupView()
    }
}

extension ShoppingCartCollectionViewCell: QuantityViewDelegate {
    func minusButtonDidTap() {
        
    }
    
    func plusButtonDidTap() {
        
    }
}

extension ShoppingCartCollectionViewCell: ViewCode {
    func setupViewHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(contentStackView)
        contentView.addSubview(quantityView)
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(sizeAndPriceLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 65),
            imageView.widthAnchor.constraint(equalToConstant: 65),
            
            contentStackView.topAnchor.constraint(equalTo: imageView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5),
            contentStackView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            
            quantityView.topAnchor.constraint(equalTo: imageView.topAnchor),
            quantityView.leadingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            quantityView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            quantityView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            quantityView.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func additionalConfiguration() {
        
    }
}
