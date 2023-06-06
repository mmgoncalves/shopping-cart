//
//  ShoppingCartPresenter.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

protocol ShoppingCartPresentationLogic {
    func updateView(with shoppingCart: ShoppingCart)
}

final class ShoppingCartPresenter {
    private weak var view: ShoppingCartDisplayLogic?
    
    init(view: ShoppingCartDisplayLogic) {
        self.view = view
    }
}

extension ShoppingCartPresenter: ShoppingCartPresentationLogic {
    func updateView(with shoppingCart: ShoppingCart) {
        let total = shoppingCart.totalPrice
        var products = shoppingCart.cartProducts
        products.sort(by: {$0.product.name < $1.product.name})
        view?.updateTotal(total)
        view?.show(products)
    }
}
