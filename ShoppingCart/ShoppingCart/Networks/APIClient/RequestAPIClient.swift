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
    
    public func request<T, U>(_ endpoint: any Endpoint, params: U?, completion: @escaping (Result<T>) -> Void) where T : Decodable, U: Encodable {
        networkAdapter.request(endpoint: endpoint, params: params) { [weak self] result in
            switch result {
            case let .success(data):
                self?.decodeObject(from: data, completion: completion)
            
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

// MARK: - Provate methods
extension RequestAPIClient {
    
    private func decodeObject<T>(from data: Data?, completion: @escaping (Result<T>) -> Void) where T: Decodable {
        guard let data else {
            completion(.failure(.undefined))
            return
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decoded))
        } catch {
            #if DEBUG
                debugPrint("Parser error => ", error)
            #endif
            completion(.failure(.parse))
        }
    }
}
