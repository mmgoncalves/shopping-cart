//
//  HomePresentationLogicMock.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 05/06/23.
//

@testable import ShoppingCart

final class HomePresentationLogicMock: HomePresentationLogic {
    private(set) var viewDidLoadInvoked = false
    private(set) var showInvoked = false
    private(set) var updateCartQuantityInvoked = false
    
    func viewDidLoad() {
        viewDidLoadInvoked = true
    }
    
    func show(_ products: [Product]) {
        showInvoked = true
    }
    
    func updateCartQuantity(with quantity: Int) {
        updateCartQuantityInvoked = true
    }
}
