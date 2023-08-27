//
//  Product.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 31/05/23.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
}

struct Product: Codable {
    var id: UUID = .init()
    let name: String
    let onSale: Bool
    let regularPrice: String
    let actualPrice: String
    let discountPercentage: String
    let image: String
    let sizes: [Size]
    
    var onlyAvailable: [Size] {
        sizes.filter({ $0.available })
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case onSale = "on_sale"
        case regularPrice = "regular_price"
        case actualPrice = "actual_price"
        case discountPercentage = "discount_percentage"
        case image
        case sizes
    }
    
    init(id: UUID = .init(), name: String, onSale: Bool, regularPrice: String, actualPrice: String, discountPercentage: String, image: String, sizes: [Size]) {
        self.id = id
        self.name = name
        self.onSale = onSale
        self.regularPrice = regularPrice
        self.actualPrice = actualPrice
        self.discountPercentage = discountPercentage
        self.image = image
        self.sizes = sizes
    }
}

extension Product: Hashable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        let combine = "\(name.hashValue)\(image.hashValue)"
        hasher.combine(combine)
    }
}
