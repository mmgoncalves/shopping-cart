//
//  Size.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

import Foundation

struct Size: Codable {
    var id: UUID = .init()
    let available: Bool
    let size: String
    let sku: String
    
    enum CodingKeys: String, CodingKey {
        case available, size, sku
    }
}

extension Size: Equatable {
    static func ==(lhs: Size, rhs: Size) -> Bool {
        lhs.id == rhs.id
    }
}

extension Size: Identifiable {

}
