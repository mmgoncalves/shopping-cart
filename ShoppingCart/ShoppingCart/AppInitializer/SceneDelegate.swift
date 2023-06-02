//
//  SceneDelegate.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 30/05/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(frame: windowScene.accessibilityFrame)
        window.windowScene = windowScene
        self.window = window
        
        let homeFactory = HomeFactory()
        let viewController = homeFactory.build()
        let navigation = UINavigationController(rootViewController: viewController)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigation.navigationBar.titleTextAttributes = textAttributes
        navigation.navigationBar.largeTitleTextAttributes = textAttributes
        navigation.navigationBar.tintColor = .white
        
        navigationController = navigation
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        
    }
}
