//
//  HomeInteractorTests.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 05/06/23.
//

import XCTest
@testable import ShoppingCart

final class HomeInteractorTests: XCTestCase {
    
    private var sut: HomeInteractor!
    private var presenterMock: HomePresentationLogicMock!
    private var serviceMock: ProductServiceMock!
    
    override func setUp() {
        super.setUp()
        presenterMock = .init()
        serviceMock = .init()
        sut = .init(presenter: presenterMock, service: serviceMock)
    }
    
    func testViewDidLoad() {
        // - given
        serviceMock.result = .success([])
        
        // - when
        sut.viewDidLoad()
        
        // - then
        XCTAssertTrue(presenterMock.viewDidLoadInvoked)
    }
    
    func testDidAddItem() {
        // - given
        XCTAssertEqual(sut.cart.quantity, 0)
        // - when
        sut.didAdd(.mock(), with: .mock())
        
        // - then
        XCTAssertEqual(sut.cart.quantity, 1)
        XCTAssertTrue(presenterMock.updateCartQuantityInvoked)
    }
}
