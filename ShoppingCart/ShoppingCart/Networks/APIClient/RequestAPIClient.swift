//
//  RequestAPIClient.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 30/05/23.
//

import Foundation

public final class RequestAPIClient {
    
    private let networkAdapter: NetworkAdapterProtocol
    
    init(networkAdapter: NetworkAdapterProtocol = NetworkAdapter()) {
        self.networkAdapter = networkAdapter
    }
}

// MARK: - Protocol implementation
extension RequestAPIClient: APIClient {
    public func request<T>(_ endpoint: any Endpoint) async -> Result<T> where T : Decodable {
        let result = await networkAdapter.request(endpoint: endpoint)
        switch result {
        case .success(let data):
            return decodeObject(from: data)
        case .failure(let networkError):
            return .failure(networkError)
        }
    }
}

// MARK: - Provate methods
extension RequestAPIClient {
    private func decodeObject<T>(from data: Data) -> Result<T> where T: Decodable {
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return .success(decoded)
        } catch {
            debugPrint("Parse error => ", error)
            return .failure(.parse)
        }
    }
}
