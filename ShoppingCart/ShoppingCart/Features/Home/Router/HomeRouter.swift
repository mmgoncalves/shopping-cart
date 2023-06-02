//
//  HomeRouter.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

import UIKit

protocol HomeRoutingLogic {
    
}

final class HomeRouter: HomeRoutingLogic {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
