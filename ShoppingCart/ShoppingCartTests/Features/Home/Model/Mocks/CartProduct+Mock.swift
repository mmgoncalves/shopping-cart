//
//  CartProduct+Mock.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 05/06/23.
//

@testable import ShoppingCart

extension CartProduct {
    static func mock() -> CartProduct {
        .init(product: .mock(), size: .mock(), quantity: 1)
    }
}
