//
//  HomeFactory.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

final class HomeFactory {
    func build() -> HomeViewController {
        let viewController = HomeViewController()
        let presenter = HomePresenter(view: viewController)
        let interactor = HomeInteractor(presenter: presenter)
        let router = HomeRouter(viewController: viewController)
        viewController.router = router
        viewController.interactor = interactor
        return viewController
    }
}
