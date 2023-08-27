//
//  UIViewController+Loading.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 02/06/23.
//

import UIKit

extension UIViewController {
    
    func startLoading() {
        let loadingView = UIKitLoadingView()
        view.addSubview(loadingView)
        view.bringSubviewToFront(loadingView)
        loadingView.frame = view.frame
        loadingView.start()
    }
    
    func stopLoading() {
        view.subviews.first(where: {$0 is UIKitLoadingView})?.removeFromSuperview()
    }
}
