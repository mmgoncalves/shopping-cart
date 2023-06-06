//
//  ShoppingCartFactory.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

final class ShoppingCartFactory {
    func build(with shoppingCart: ShoppingCart) -> ShoppingCartViewController {
        let cartViewController = ShoppingCartViewController()
        cartViewController.title = "Carrinho"
        let presenter = ShoppingCartPresenter(view: cartViewController)
        let interactor = ShoppingCartInteractor(presenter: presenter, shoppingCart: shoppingCart)
        let router = ShoppingCartRouter(viewController: cartViewController)
        cartViewController.router = router
        cartViewController.interactor = interactor
        return cartViewController
    }
}
