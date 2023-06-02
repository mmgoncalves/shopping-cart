//
//  ShoppingCart.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 31/05/23.
//

import Foundation

struct ShoppingCart: Codable {
    let products: [cartProduct]
}

struct cartProduct: Codable {
    let product: Product
    let size: Size
    let quantity: Int
}
