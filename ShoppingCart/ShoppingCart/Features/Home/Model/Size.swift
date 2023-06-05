//
//  Size.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

import Foundation

struct Size: Codable {
    let available: Bool
    let size: String
    let sku: String
}

extension Size: Equatable {
    static func ==(lhs: Size, rhs: Size) -> Bool {
        lhs.sku == rhs.sku && lhs.size == rhs.size
    }
}
