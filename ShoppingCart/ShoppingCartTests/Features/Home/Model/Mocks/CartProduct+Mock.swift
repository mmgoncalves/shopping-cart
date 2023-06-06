//
//  CartProduct+Mock.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 05/06/23.
//

@testable import ShoppingCart

extension CartProduct {
    static func mock(quantity: Int = 1) -> CartProduct {
        .init(product: .mock(), size: .mock(), quantity: quantity)
    }
}
