//
//  APIConfig.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 30/05/23.
//

public protocol APIConfigProtocol {
    var basePath: String { get }
}

public final class APIConfig: APIConfigProtocol {
    public var basePath: String {
//        /59b6a65a0f0000e90471257da
        "https://www.mocky.io/v2"
    }
    
    public static var shared: APIConfig {
        .init()
    }
    
    private init() { }
}
