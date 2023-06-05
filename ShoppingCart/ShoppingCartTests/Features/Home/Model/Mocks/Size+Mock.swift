//
//  Size+Mock.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 05/06/23.
//

@testable import ShoppingCart

extension Size {
    static func mock(available: Bool = true, size: String = "P") -> Size {
        .init(available: available, size: size, sku: size)
    }
}
