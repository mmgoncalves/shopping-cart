//
//  Size+PreviewData.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 26/08/23.
//

import Foundation

extension Size {
    
    static func mock(size: String = "P") -> Size {
        .init(
            available: true,
            size: size,
            sku: size
        )
    }
}
