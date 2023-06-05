//
//  ShoppingCart.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 31/05/23.
//

import Foundation

struct ShoppingCart {
    var products: Set<CartProduct>
    var quantity: Int {
        products.count
    }
    
    mutating func add(_ product: Product, with size: Size) {
        if var cartProduct = getCartProduct(from: product, with: size) {
            cartProduct.quantity += 1
            products.insert(cartProduct)
        } else {
            let cartProduct = CartProduct(product: product, size: size, quantity: 1)
            products.insert(cartProduct)
        }
    }
    
    private func getCartProduct(from product: Product, with size: Size) -> CartProduct? {
        products.first(where: {$0.product == product && $0.size == size})
    }
}

struct CartProduct: Hashable {
    let product: Product
    let size: Size
    var quantity: Int
    var id: UUID {
        UUID()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
