//
//  HomeRouter.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

import UIKit
import SwiftUI

protocol HomeRoutingLogic {
    func showSizePicker(with product: Product, delegate: SizePickerDelegate)
    func goToShoppingCart(shoppingCart: ShoppingCart)
}

final class HomeRouter: HomeRoutingLogic {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showSizePicker(with product: Product, delegate: SizePickerDelegate) {
        let pickerView = SizerPickerView(product: product) { [weak self, product, delegate] size in
            delegate.didSelect(size, from: product)
            self?.viewController?.presentedViewController?.dismiss(animated: true)
        }
        let host = UIHostingController(rootView: pickerView)
        host.modalPresentationStyle = .formSheet
        if let sheet = host.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        host.view.backgroundColor = .white
        viewController?.present(host, animated: true)
    }
    
    func goToShoppingCart(shoppingCart: ShoppingCart) {
        let shoppingCartFactory = ShoppingCartFactory()
        let shoppingCartViewController = shoppingCartFactory.build(with: shoppingCart)
        viewController?.navigationController?.pushViewController(shoppingCartViewController, animated: true)
    }
    
    private func dismissCurrentVC() {
        viewController?.presentedViewController?.dismiss(animated: true)
    }
}
