//
//  ShoppingCartPresenter.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

protocol ShoppingCartPresentationLogic {
    func viewDidLoad(with shoppingCart: ShoppingCart)
}

final class ShoppingCartPresenter {
    private weak var view: ShoppingCartDisplayLogic?
    
    init(view: ShoppingCartDisplayLogic) {
        self.view = view
    }
}

extension ShoppingCartPresenter: ShoppingCartPresentationLogic {
    func viewDidLoad(with shoppingCart: ShoppingCart) {
        let total = shoppingCart.totalPrice
        let products = shoppingCart.products.compactMap({$0.value})
        view?.updateTotal(total)
        view?.show(products)
    }
}
