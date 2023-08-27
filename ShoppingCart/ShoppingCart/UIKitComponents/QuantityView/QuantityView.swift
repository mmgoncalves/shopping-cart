//
//  QuantityView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 06/06/23.
//

import UIKit

protocol QuantityViewDelegate: AnyObject {
    func plusButtonDidTap()
    func minusButtonDidTap()
}

final class QuantityView: UIView {
    // MARK: - Properties
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle, scale: .large)
        let config2 = UIImage.SymbolConfiguration(paletteColors: [.systemBlue])
        let combined = config.applying(config2)
        let image = UIImage(systemName: "minus.circle.fill", withConfiguration: combined)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(minusButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont(24)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle, scale: .large)
        let config2 = UIImage.SymbolConfiguration(paletteColors: [.systemBlue])
        let combined = config.applying(config2)
        let image = UIImage(systemName: "plus.circle.fill", withConfiguration: combined)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(plusButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private weak var delegate: QuantityViewDelegate?
    
    init(delegate: QuantityViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ quantity: Int) {
        quantityLabel.text = "\(quantity)"
    }
    
    func prepareForReuse() {
        quantityLabel.text = ""
    }
    
    @objc private func minusButtonDidTap(_ sender: AnyObject) {
        delegate?.minusButtonDidTap()
    }
    
    @objc private func plusButtonDidTap(_ sender: AnyObject) {
        delegate?.plusButtonDidTap()
    }
}

extension QuantityView: ViewCode {
    func setupViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(minusButton)
        contentView.addSubview(quantityLabel)
        contentView.addSubview(plusButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            minusButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            minusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            minusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 30),
            
            quantityLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 6),
            quantityLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -6),
            quantityLabel.centerYAnchor.constraint(equalTo: minusButton.centerYAnchor),
            
            plusButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            plusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
