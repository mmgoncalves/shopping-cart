//
//  EndpointMock.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 31/05/23.
//

@testable import ShoppingCart
import Foundation

struct EndpointMock: Endpoint {
    typealias Parameters = ModelMock
    
    var path: String = "/path"
    var method: RequestMethod = .get
    var parameters: ModelMock?
    var queryItems: [URLQueryItem]?
}

struct ModelMock: Codable {
    let test: String
}
