//
//  ShoppingCartRouter.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 05/06/23.
//

import UIKit

protocol ShoppingCartRoutingLogic: AnyObject {
    
}

final class ShoppingCartRouter {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension ShoppingCartRouter: ShoppingCartRoutingLogic {
    
}
