//
//  ProductServiceMock.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 05/06/23.
//

@testable import ShoppingCart

final class ProductServiceMock: ProductServiceProtocol {
    var result: Result<[Product]>?
    
    func getProductList() async -> Result<[Product]> {
        if let result {
            return result
        } else {
            return .failure(.undefined)
        }
    }
}
