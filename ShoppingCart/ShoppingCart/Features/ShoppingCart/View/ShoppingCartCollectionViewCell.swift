//
//  ShoppingCartCollectionViewCell.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

import UIKit

protocol ShoppingCartCollectionViewCellDelegate: AnyObject {
    func minusButtonDidTap(from cartProduct: CartProduct)
    func plusButtonDidTap(from cartProduct: CartProduct)
}

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
    
    private var cartProduct: CartProduct?
    private weak var delegate: ShoppingCartCollectionViewCellDelegate?
    
    func setup(cartProduct: CartProduct, delegate: ShoppingCartCollectionViewCellDelegate) {
        self.cartProduct = cartProduct
        self.delegate = delegate
        imageView.loadImage(from: cartProduct.product.image)
        quantityView.update(cartProduct.quantity)
        let sizeAndPrice = "\(cartProduct.size.size) - \(cartProduct.product.actualPrice)"
        sizeAndPriceLabel.text = sizeAndPrice
        nameLabel.text = cartProduct.product.name
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cartProduct = nil
        delegate = nil
        imageView.image = imagePlaceholder
        quantityView.prepareForReuse()
        sizeAndPriceLabel.text = ""
        nameLabel.text = ""
    }
}

extension ShoppingCartCollectionViewCell: QuantityViewDelegate {
    func minusButtonDidTap() {
        guard let cartProduct else { return }
        delegate?.minusButtonDidTap(from: cartProduct)
    }
    
    func plusButtonDidTap() {
        guard let cartProduct else { return }
        delegate?.plusButtonDidTap(from: cartProduct)
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
}
