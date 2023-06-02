//
//  HomeInteractor.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

protocol HomeBusinessLogic {
    func viewDidLoad()
}

final class HomeInteractor: HomeBusinessLogic {
    private let presenter: HomePresentationLogic
    private let service: ProductServiceProtocol
    private var products: [Product] = []
    
    init(
        presenter: HomePresentationLogic,
        service: ProductServiceProtocol = ProductService()
    ) {
        self.presenter = presenter
        self.service = service
    }
    
    func viewDidLoad()  {
        Task {
            let result = await service.getProductList()
            switch result {
            case .success(let products):
                self.products = products
                await MainActor.run {
                    presenter.show(products)
                }
            case .failure(let networkError):
                print("Network Error: ", networkError) // TODO: The failure flow must be implemented next sprint
            }
        }
    }
}
