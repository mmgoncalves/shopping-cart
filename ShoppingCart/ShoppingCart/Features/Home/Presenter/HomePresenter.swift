//
//  HomePresenter.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

protocol HomePresentationLogic {
    func show(_ products: [Product])
}

final class HomePresenter: HomePresentationLogic {
    private weak var view: HomeDisplayLogic?
    
    init(view: HomeDisplayLogic) {
        self.view = view
    }
    
    func show(_ products: [Product]) {
        view?.show(products)
    }
}
