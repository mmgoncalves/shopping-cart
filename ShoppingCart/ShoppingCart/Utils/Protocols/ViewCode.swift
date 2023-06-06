//
//  ViewCode.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

protocol ViewCode {
    func setupView()
    func setupViewHierarchy()
    func setupConstraints()
    func additionalConfiguration()
}

extension ViewCode {
    func setupView() {
        setupViewHierarchy()
        setupConstraints()
        additionalConfiguration()
    }
    
    func additionalConfiguration() {}
}
