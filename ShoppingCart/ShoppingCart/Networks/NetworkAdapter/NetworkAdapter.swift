//
//  NetworkAdapter.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 30/05/23.
//

import Foundation

public protocol NetworkAdapterProtocol {
    func request<U: Encodable>(
        endpoint: any Endpoint,
        params: U?,
        completion: @escaping (Result<Data?>) -> Void
    )
}

public final class NetworkAdapter {
    
    private var apiConfig: APIConfigProtocol
    
    init(apiConfig: APIConfigProtocol = APIConfig.shared) {
        self.apiConfig = apiConfig
    }
}

// MARK: - Protocol implementation
extension NetworkAdapter: NetworkAdapterProtocol {
    
    public func request<U: Encodable>(
        endpoint: any Endpoint,
        params: U?,
        completion: @escaping(Result<Data?>) -> Void)
    {
        let fullPath = apiConfig.basePath + endpoint.path
        let method: HTTPMethod = .init(rawValue: endpoint.method.rawValue)
        var headers: HTTPHeaders?
        if let token = apiConfig.authToken {
            headers = HTTPHeaders.init(dictionaryLiteral: ("Authorization", token))
        }
        
        AF.request(
            fullPath,
            method: method,
            parameters: params,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
        .validate(statusCode: 200..<300)
        .response { [headersHandler, completionHandler] dataResponse in
            headersHandler(dataResponse.response?.headers)
            completionHandler(dataResponse, completion)
            
        }
    }
}

// MARK: - Provate methods
extension NetworkAdapter {
    
    private func completionHandler(_ dataResponse: AFDataResponse<Data?>, completion: @escaping(Result<Data?>) -> Void) {
        switch dataResponse.result {
        case let .success(data):
            completion(.success(data))
        
        case let .failure(afError):
            #if DEBUG
                debugPrint("Request error => ", afError)
            #endif
            
            let error = NetworkError(rawValue: dataResponse.response?.statusCode ?? 0) ?? .undefined
            completion(.failure(error))
        }
    }
    
//    private func headersHandler(_ headers: HTTPHeaders?) {
//        if let token = headers?.value(for: "Authorization") {
//            apiConfig.update(token: token)
//        }
//    }
}
