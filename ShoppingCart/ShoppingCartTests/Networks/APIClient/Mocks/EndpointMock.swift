//
//  EndpointMock.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 31/05/23.
//

@testable import ShoppingCart
import Foundation

struct EndpointMock: Endpoint {
    var path: String = "/path"
    var method: RequestMethod = .get
}

struct ModelMock: Codable {
    let test: String
}
