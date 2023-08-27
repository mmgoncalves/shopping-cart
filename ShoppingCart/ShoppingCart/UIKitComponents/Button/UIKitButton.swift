//
//  UIKitButton.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

import UIKit

final class UIKitButton: UIButton {
    private var title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIKitButton: ViewCode {
    func setupViewHierarchy() {
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func additionalConfiguration() {
        backgroundColor = .systemGreen
        let title = NSAttributedString(
            string: title,
            attributes: [
                .font: UIFont.defaultFont(18)
            ]
        )
        setAttributedTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
    }
}
