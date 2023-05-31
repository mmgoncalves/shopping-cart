//
//  SceneDelegate.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 30/05/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(frame: windowScene.accessibilityFrame)
        window.windowScene = windowScene
        self.window = window
        
    }
}
