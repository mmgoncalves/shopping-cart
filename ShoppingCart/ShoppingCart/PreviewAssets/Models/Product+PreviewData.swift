//
//  Product+PreviewData.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 26/08/23.
//

extension Product {
    static var mock: Product {
        .init(
            name: "Product Name with more than one line",
            onSale: true,
            regularPrice: "R$ 200,00",
            actualPrice: "R$100,00",
            discountPercentage: "50%",
            image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
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
