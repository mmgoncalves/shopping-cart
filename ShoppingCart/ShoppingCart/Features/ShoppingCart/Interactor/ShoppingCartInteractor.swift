//
//  ShoppingCartInteractor.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

protocol ShoppingCartBusinessLogic {
    func viewDidLoad()
}

final class ShoppingCartInteractor {
    private let presenter: ShoppingCartPresentationLogic
    private let shoppingCart: ShoppingCart
    
    init(presenter: ShoppingCartPresentationLogic, shoppingCart: ShoppingCart) {
        self.presenter = presenter
        self.shoppingCart = shoppingCart
    }
}

extension ShoppingCartInteractor: ShoppingCartBusinessLogic {
    func viewDidLoad() {
        presenter.viewDidLoad(with: shoppingCart)
    }
}
