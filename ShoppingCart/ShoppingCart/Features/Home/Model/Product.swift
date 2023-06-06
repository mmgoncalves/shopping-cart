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
}

extension Product: Hashable {
    func hash(into hasher: inout Hasher) {
        let combine = "\(name.hashValue)\(image.hashValue)"
        hasher.combine(combine)
    }
}
