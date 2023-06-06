//
//  ShoppingCartInteractor.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

protocol ShoppingCartBusinessLogic {
    func viewDidLoad()
    func minusButtonDidTap(from cartProduct: CartProduct)
    func plusButtonDidTap(from cartProduct: CartProduct)
}

final class ShoppingCartInteractor {
    private let presenter: ShoppingCartPresentationLogic
    private var shoppingCart: ShoppingCart
    
    init(presenter: ShoppingCartPresentationLogic, shoppingCart: ShoppingCart) {
        self.presenter = presenter
        self.shoppingCart = shoppingCart
    }
}

extension ShoppingCartInteractor: ShoppingCartBusinessLogic {
    func viewDidLoad() {
        presenter.updateView(with: shoppingCart)
    }
    
    func minusButtonDidTap(from cartProduct: CartProduct) {
        if cartProduct.quantity == 1 {
            shoppingCart.remove(cartProduct)
        } else {
            shoppingCart.increaseQuantity(of: cartProduct)
        }
        
        presenter.updateView(with: shoppingCart)
    }
    
    func plusButtonDidTap(from cartProduct: CartProduct) {
        shoppingCart.increaseQuantity(of: cartProduct)
        presenter.updateView(with: shoppingCart)
    }
}
