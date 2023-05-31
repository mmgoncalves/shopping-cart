//
//  Endpoint.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 30/05/23.
//

import Foundation

public protocol Endpoint {
    associatedtype Parameters
    
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: Parameters? { get }
    var queryItems: [URLQueryItem]? { get }
}

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}
