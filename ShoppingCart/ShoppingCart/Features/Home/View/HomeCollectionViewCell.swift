//
//  HomeCollectionViewCell.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

import UIKit

protocol HomeCollectionViewCellDelegate: AnyObject {
    func didAdd(_ product: Product)
}

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
    
    private lazy var amountView: UIKitAmountView = {
        let view = UIKitAmountView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sizeListView: SizeListView = {
        let view = SizeListView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var product: Product?
    private var selectedSize: Size?
    private weak var delegate: HomeCollectionViewCellDelegate?
    
    override func prepareForReuse() {
        product = nil
        titleLabel.text = ""
        imageView.image = imagePlaceholder
        discountView.isHidden = true
        amountView.isHidden = true
        discountView.prepareForReuse()
        amountView.prepareForReuse()
        sizeListView.prepareForReuse()
        super.prepareForReuse()
    }
    
    func setupCell(with product: Product, delegate: HomeCollectionViewCellDelegate) {
        self.product = product
        self.delegate = delegate
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
        sizeListView.setup(with: product.onlyAvailable)
        setupView()
    }
    
    @objc private func addButtomDidTap(_ sender: AnyObject) {
        guard let product else { return }
        delegate?.didAdd(product)
    }
}

extension HomeCollectionViewCell: ViewCode {
    func setupViewHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(discountView)
        contentView.addSubview(addItemButton)
        contentView.addSubview(amountView)
        contentView.addSubview(sizeListView)
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
            discountView.centerYAnchor.constraint(equalTo: addItemButton.centerYAnchor),
            
            addItemButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            addItemButton.topAnchor.constraint(greaterThanOrEqualTo: imageView.bottomAnchor, constant: 10),
            addItemButton.widthAnchor.constraint(equalToConstant: 40),
            addItemButton.heightAnchor.constraint(equalToConstant: 40),
            
            amountView.topAnchor.constraint(equalTo: addItemButton.bottomAnchor),
            amountView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            amountView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            sizeListView.topAnchor.constraint(equalTo: amountView.bottomAnchor, constant: 6),
            sizeListView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            sizeListView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            sizeListView.heightAnchor.constraint(equalToConstant: 12),
        ])
        
        let height = sizeListView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        height.priority = .defaultHigh
        height.isActive = true
    }
    
    func additionalConfiguration() {
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 0.5
        contentView.layer.cornerRadius = 6
    }
}
