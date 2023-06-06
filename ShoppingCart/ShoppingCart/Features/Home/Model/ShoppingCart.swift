//
//  ShoppingCart.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 31/05/23.
//

import Foundation

struct ShoppingCart {
    var products: [Int: CartProduct]
    var cartProducts: [CartProduct] {
        products.compactMap({ $0.value })
    }
    var quantity: Int {
        products.reduce(0, {$0 + $1.value.quantity })
    }
    var totalPrice: String {
        "R$ 100,00"
    }
    
    mutating func add(_ product: Product, with size: Size) {
        if let cartProduct = products.first(where: {$0.value.product == product && $0.value.size == size})?.value {
            products[cartProduct.hashValue]?.quantity += 1
        } else {
            let cartProduct = CartProduct(product: product, size: size, quantity: 1)
            products[cartProduct.hashValue] = cartProduct
        }
    }
    
    mutating func add(_ cartProduct: CartProduct) {
        products[cartProduct.hashValue] = cartProduct
    }
    
    mutating func increaseQuantity(of cartProduct: CartProduct) {
        products[cartProduct.hashValue]?.quantity += 1
    }
    
    mutating func decreaseQuantity(_ cartProduct: CartProduct) {
        products[cartProduct.hashValue]?.quantity -= 1
    }
    
    mutating func remove(_ cartProduct: CartProduct) {
        products.removeValue(forKey: cartProduct.hashValue)
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
