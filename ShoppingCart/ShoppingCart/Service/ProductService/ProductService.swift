//
//  ProductService.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

protocol ProductServiceProtocol {
    func getProductList() async -> Result<[Product]>
}

final class ProductService: ProductServiceProtocol {
    private let apiClient: APIClient
    private let endpoit: Endpoint
    
    init(
        apiClient: APIClient = RequestAPIClient(),
        endpoit: Endpoint = ProductServiceEndpoint()
    ) {
        self.apiClient = apiClient
        self.endpoit = endpoit
    }
    
    func getProductList() async -> Result<[Product]> {
        let result: Result<ProductResponse> = await apiClient.request(endpoit)
        switch result {
        case .success(let productResponse):
            return .success(productResponse.products)
        case .failure(let networkError):
            return .failure(networkError)
        }
    }
}
