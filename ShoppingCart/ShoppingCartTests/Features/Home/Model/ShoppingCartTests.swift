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
}
