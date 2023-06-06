//
//  HomePresenter.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

protocol HomePresentationLogic {
    func viewDidLoad()
    func show(_ products: [Product])
    func updateCartQuantity(with quantity: Int)
    func goToShoppingCart(with shoppingCart: ShoppingCart)
}

final class HomePresenter: HomePresentationLogic {
    private weak var view: HomeDisplayLogic?
    
    init(view: HomeDisplayLogic) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.startLoading()
    }
    
    func show(_ products: [Product]) {
        view?.show(products)
        view?.stopLoading()
    }
    
    func updateCartQuantity(with quantity: Int) {
        view?.updateCartQuantity(with: quantity)
    }
    
    func goToShoppingCart(with shoppingCart: ShoppingCart) {
        view?.goToShoppingCart(with: shoppingCart)
    }
}
