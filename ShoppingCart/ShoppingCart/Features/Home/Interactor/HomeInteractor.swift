//
//  HomeInteractor.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

protocol HomeBusinessLogic {
    func viewDidLoad()
    func didAdd(_ product: Product, with size: Size)
    func payButtonDidTap()
    func promotionSwitchChange(to isOn: Bool)
}

final class HomeInteractor: HomeBusinessLogic {
    private let presenter: HomePresentationLogic
    private let service: ProductServiceProtocol
    private var products: [Product] = []
    private var promotionFilter: [Product] {
        products.filter({$0.onSale})
    }
    private(set) var cart = ShoppingCart(products: [:])
    
    init(
        presenter: HomePresentationLogic,
        service: ProductServiceProtocol = ProductService()
    ) {
        self.presenter = presenter
        self.service = service
    }
    
    func viewDidLoad()  {
        presenter.viewDidLoad()
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
    
    func didAdd(_ product: Product, with size: Size) {
        cart.add(product, with: size)
        presenter.updateCartQuantity(with: cart.quantity)
    }
    
    func payButtonDidTap() {
        presenter.goToShoppingCart(with: cart)
    }
    
    func promotionSwitchChange(to isOn: Bool) {
        if isOn {
            presenter.show(promotionFilter)
        } else {
            presenter.show(products)
        }
    }
}
