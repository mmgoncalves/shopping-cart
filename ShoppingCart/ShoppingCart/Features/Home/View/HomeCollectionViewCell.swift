//
//  HomeCollectionViewCell.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell"
    
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont()
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imagePlaceholder: UIImage? = {
        let config = UIImage.SymbolConfiguration(font: .defaultFont(50), scale: .large)
        return UIImage(systemName: "tshirt", withConfiguration: config)
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = imagePlaceholder
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var addItemButton: UIButton = {
        let addButton = UIButton()
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle, scale: .large)
        let config2 = UIImage.SymbolConfiguration(paletteColors: [.systemBlue])
        let combined = config.applying(config2)
        let image = UIImage(systemName: "plus.circle.fill", withConfiguration: combined)
        addButton.setImage(image, for: .normal)
        addButton.addTarget(self, action: #selector(addButtomDidTap), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    private lazy var discountView: DiscountView = {
        let view = DiscountView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var amountView: AmountView = {
        let view = AmountView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func prepareForReuse() {
        titleLabel.text = ""
        imageView.image = imagePlaceholder
        discountView.isHidden = true
        amountView.isHidden = true
        discountView.prepareForReuse()
        amountView.prepareForReuse()
        super.prepareForReuse()
    }
    
    func setupCell(with product: Product) {
        titleLabel.text = product.name
        imageView.loadImage(from: product.image)
        discountView.isHidden = !product.onSale
        amountView.isHidden = false
        if product.onSale {
            discountView.setup(discountPercentage: product.discountPercentage)
        }
        amountView.setup(
            regularPrice: product.regularPrice,
            actualPrice: product.actualPrice,
            onSale: product.onSale
        )
        setupView()
    }
    
    @objc private func addButtomDidTap(_ sender: AnyObject) {
        print("add button did tap =>")
    }
    
}

extension HomeCollectionViewCell: ViewCode {
    func setupViewHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(discountView)
        contentView.addSubview(addItemButton)
        contentView.addSubview(amountView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            discountView.topAnchor.constraint(greaterThanOrEqualTo: imageView.bottomAnchor, constant: 10),
            discountView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            addItemButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            addItemButton.centerYAnchor.constraint(equalTo: discountView.centerYAnchor),
            addItemButton.widthAnchor.constraint(equalToConstant: 40),
            addItemButton.heightAnchor.constraint(equalToConstant: 40),
            
            amountView.topAnchor.constraint(equalTo: addItemButton.bottomAnchor),
            amountView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            amountView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            amountView.heightAnchor.constraint(equalToConstant: 33),
        ])
        
        let height = amountView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        height.priority = .defaultHigh
        height.isActive = true
    }
    
    func additionalConfiguration() {
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 0.5
        contentView.layer.cornerRadius = 6
    }
}
