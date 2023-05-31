//
//  APIClient.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 30/05/23.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(NetworkError)
}

public protocol APIClient {
    func request<T: Decodable, U: Encodable>(_ endpoint: any Endpoint, params: U?, completion: @escaping (Result<T>) -> Void)
}
