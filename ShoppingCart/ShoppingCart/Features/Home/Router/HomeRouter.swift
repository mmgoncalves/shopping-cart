//
//  HomeRouter.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

import UIKit

protocol HomeRoutingLogic {
    func showSizePicker(with product: Product, delegate: SizePickerDelegate)
}

final class HomeRouter: HomeRoutingLogic {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showSizePicker(with product: Product, delegate: SizePickerDelegate) {
        let pickerView = SizePickerViewController(product: product, delegate: delegate)
        pickerView.modalPresentationStyle = .formSheet
        if let sheet = pickerView.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        viewController?.present(pickerView, animated: true)
    }
}
