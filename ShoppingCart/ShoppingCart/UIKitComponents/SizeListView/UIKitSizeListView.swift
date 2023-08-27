//
//  UIKitSizeListView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 03/06/23.
//

import UIKit

final class UIKitSizeListView: UIView {
    private lazy var sizeListLabel: UILabel = {
        let label = UILabel()
        label.font = .defaultFont(12)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup(with sizes: [Size]) {
        let sizeList = sizes.compactMap({ "\($0.size)" }).joined(separator: " - ")
        sizeListLabel.text = sizeList
        setupView()
    }
    
    func prepareForReuse() {
        sizeListLabel.text = ""
    }
}

extension UIKitSizeListView: ViewCode {
    func setupViewHierarchy() {
        addSubview(sizeListLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            sizeListLabel.topAnchor.constraint(equalTo: topAnchor),
            sizeListLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sizeListLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            sizeListLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
