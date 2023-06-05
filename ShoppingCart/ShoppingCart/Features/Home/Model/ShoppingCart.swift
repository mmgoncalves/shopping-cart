//
//  ShoppingCart.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 31/05/23.
//

import Foundation

struct ShoppingCart {
    var products: [Int: CartProduct]
    var quantity: Int {
        products.reduce(0, {$0 + $1.value.quantity })
    }
    
    mutating func add(_ product: Product, with size: Size) {
        if var cartProduct = getCartProduct(from: product, with: size) {
            cartProduct.quantity += 1
            products[cartProduct.hashValue] = cartProduct
        } else {
            let cartProduct = CartProduct(product: product, size: size, quantity: 1)
            products[cartProduct.hashValue] = cartProduct
        }
    }
    
    private func getCartProduct(from product: Product, with size: Size) -> CartProduct? {
        products.first(where: {$0.value.product == product && $0.value.size == size})?.value
    }
}

struct CartProduct: Hashable, Equatable {
    let product: Product
    let size: Size
    var quantity: Int
    
    func hash(into hasher: inout Hasher) {
        let combine = "\(product.hashValue)\(size.size.hash)"
        hasher.combine(combine)
    }
}
