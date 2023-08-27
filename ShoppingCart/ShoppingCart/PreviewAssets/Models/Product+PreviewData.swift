//
//  Product+PreviewData.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 26/08/23.
//

extension Product {
    static var mock: Product {
        .init(
            name: "",
            onSale: true,
            regularPrice: "",
            actualPrice: "",
            discountPercentage: "",
            image: "",
            sizes: [
                .init(
                    available: true,
                    size: "P",
                    sku: "p"
                ),
                .init(
                    available: true,
                    size: "M",
                    sku: "m"
                ),
                .init(
                    available: true,
                    size: "G",
                    sku: "g"
                ),
                .init(
                    available: false,
                    size: "GG",
                    sku: "gg"
                )
            ]
        )
    }
}
