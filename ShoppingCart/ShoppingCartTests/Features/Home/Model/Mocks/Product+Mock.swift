//
//  Product+Mock.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 05/06/23.
//

@testable import ShoppingCart

extension Product {
    static func mock() -> Product {
        .init(
            name: "Name",
            onSale: true,
            regularPrice: "R$ 100,00",
            actualPrice: "R$ 90,00",
            discountPercentage: "10%",
            image: "",
            sizes: [
                .mock(),
                    .mock(available: false, size: "M"),
                    .mock(size: "G")
            ]
        )
    }
}
