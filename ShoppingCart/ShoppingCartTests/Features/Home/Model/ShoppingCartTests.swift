//
//  ShoppingCartTests.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 05/06/23.
//

import XCTest
@testable import ShoppingCart

final class ShoppingCartTests: XCTestCase {
    
    private var sut: ShoppingCart!
    
    override func setUp() {
        super.setUp()
        sut = .init(products: [:])
    }
    
    func testAddProduct() {
        // - given
        XCTAssertEqual(sut.products.count, 0)
        let product = Product.mock()
        let size = Size.mock(size: "M")
        
        // - when
        sut.add(product, with: size)
        
        // - then
        XCTAssertEqual(sut.products.count, 1)
        XCTAssertEqual(sut.products.first?.value.quantity, 1)
    }
    
    func testAddCartProduct() {
        // - given
        XCTAssertEqual(sut.products.count, 0)
        let mock = CartProduct.mock(quantity: 2)
        
        // - when
        sut.add(mock)
        
        // - then
        XCTAssertEqual(sut.products.count, 1)
        XCTAssertEqual(sut.products.first?.value.quantity, 2)
    }
    
    func testUpdateQuantity() {
        // - given
        XCTAssertEqual(sut.products.count, 0)
        let product = Product.mock()
        let size = Size.mock(size: "M")
        
        // - when
        sut.add(product, with: size)
        sut.add(product, with: size)
        
        // - then
        XCTAssertEqual(sut.products.count, 1)
        XCTAssertEqual(sut.products.first?.value.quantity, 2)
    }
    
    func testTotal() {
        // - given
        XCTAssertEqual(sut.totalPrice, "R$ 0,00")
        let mock = CartProduct.mock(quantity: 3)
        
        // - when
        sut.add(mock)
        sut.decreaseQuantity(mock)
        
        // - then
        XCTAssertEqual(sut.totalPrice, "R$ 180,00")
    }
    
    func testIncreaseCartProductQuantity() {
        // - given
        let mock = CartProduct.mock(quantity: 2)
        sut.add(mock)
        XCTAssertEqual(sut.products.count, 1)
        XCTAssertEqual(sut.products.first?.value.quantity, 2)
        
        // - when
        sut.increaseQuantity(of: mock)
        
        // - then
        XCTAssertEqual(sut.products.count, 1)
        XCTAssertEqual(sut.products.first?.value.quantity, 3)
    }
    
    func testDecreaseCartProductQuantity() {
        // - given
        let mock = CartProduct.mock(quantity: 2)
        sut.add(mock)
        XCTAssertEqual(sut.products.count, 1)
        XCTAssertEqual(sut.products.first?.value.quantity, 2)
        
        // - when
        sut.decreaseQuantity(mock)
        
        // - then
        XCTAssertEqual(sut.products.count, 1)
        XCTAssertEqual(sut.products.first?.value.quantity, 1)
    }
    
    func testRemoveProduct() {
        // - given
        let mock = CartProduct.mock()
        sut.add(mock)
        XCTAssertEqual(sut.products.count, 1)
        
        // - when
        sut.remove(mock)
        
        // - then
        XCTAssertEqual(sut.products.count, 0)
    }
}
