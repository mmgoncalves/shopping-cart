//
//  UIKitLoadingView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 02/06/23.
//

import UIKit

final class UIKitLoadingView: UIView {
    private lazy var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.tintColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func start() {
        loadingView.startAnimating()
        setupView()
    }
}

extension UIKitLoadingView: ViewCode {
    func setupViewHierarchy() {
        addSubview(loadingView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingView.widthAnchor.constraint(equalToConstant: 50),
            loadingView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func additionalConfiguration() {
        backgroundColor = .black.withAlphaComponent(0.3)
    }
}
