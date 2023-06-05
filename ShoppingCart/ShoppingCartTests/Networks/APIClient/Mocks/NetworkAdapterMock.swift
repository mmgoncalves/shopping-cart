//
//  NetworkAdapterMock.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 31/05/23.
//

import Foundation
@testable import ShoppingCart

final class NetworkAdapterMock: NetworkAdapterProtocol {
    var result: Result<Data>?
    
    func request(endpoint: any Endpoint) async -> Result<Data> {
        if let result {
            return result
        } else {
            return .failure(.undefined)
        }
    }
}
