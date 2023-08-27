//
//  CartView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 03/06/23.
//

import UIKit

final class CartView: UIView {
    
    // MARK: - Properties
    private lazy var cartEmptyImage: UIImage? = {
        let config = UIImage.SymbolConfiguration(textStyle: .headline, scale: .large)
        let config2 = UIImage.SymbolConfiguration(paletteColors: [.lightGray])
        let combined = config.applying(config2)
        let image = UIImage(systemName: "cart", withConfiguration: combined)
        return image
    }()
    
    private lazy var cartImage: UIImage? = {
        let config = UIImage.SymbolConfiguration(textStyle: .headline, scale: .large)
        let config2 = UIImage.SymbolConfiguration(paletteColors: [.systemBlue])
        let combined = config.applying(config2)
        let image = UIImage(systemName: "cart.fill", withConfiguration: combined)
        return image
    }()
    
    private lazy var cartIcon: UIImageView = {
        let imageView = UIImageView(image: cartEmptyImage)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var badgeContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.clipsToBounds = true
        view.isHidden = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.75
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var badgeLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont(10)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(numberOfProducts: Int) {
        if numberOfProducts < 1 {
            badgeContentView.isHidden = true
            cartIcon.image = cartEmptyImage
        } else {
            badgeContentView.isHidden = false
            cartIcon.image = cartImage
            badgeLabel.text = "\(numberOfProducts)"
        }
        
        layoutIfNeeded()
    }
}

extension CartView: ViewCode {
    func setupViewHierarchy() {
        addSubview(cartIcon)
        addSubview(badgeContentView)
        badgeContentView.addSubview(badgeLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cartIcon.topAnchor.constraint(equalTo: topAnchor),
            cartIcon.trailingAnchor.constraint(equalTo: trailingAnchor),
            cartIcon.widthAnchor.constraint(equalToConstant: 33),
            cartIcon.heightAnchor.constraint(equalToConstant: 33),
            
            badgeContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            badgeContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            badgeContentView.widthAnchor.constraint(equalToConstant: 18),
            badgeContentView.heightAnchor.constraint(equalToConstant: 18),
            
            badgeLabel.centerXAnchor.constraint(equalTo: badgeContentView.centerXAnchor),
            badgeLabel.centerYAnchor.constraint(equalTo: badgeContentView.centerYAnchor),
        ])
    }
    
    func additionalConfiguration() {
        badgeContentView.layer.cornerRadius = 9
    }
}
