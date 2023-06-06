//
//  RequestAPIClientTests.swift
//  ShoppingCartTests
//
//  Created by Mateus Marques on 31/05/23.
//

import XCTest
@testable import ShoppingCart

final class RequestAPIClientTests: XCTestCase {
    
    private var sut: RequestAPIClient!
    private var networkAdapterMock: NetworkAdapterMock!
    
    override func setUp() {
        super.setUp()
        networkAdapterMock = .init()
        sut = .init(networkAdapter: networkAdapterMock)
    }
    
    func testRequestWithSuccess() async {
        let modelMock = ModelMock(test: "test")
        let data = try? JSONEncoder().encode(modelMock)
        networkAdapterMock.result = .success(data!)
        let endpointMock = EndpointMock()
        let result: Result<ModelMock> = await sut.request(endpointMock)
        switch result {
        case .success(let model):
            XCTAssertEqual(modelMock.test, model.test)
        case .failure:
            XCTFail()
        }
    }
    
    func testRequestWithError() async {
        networkAdapterMock.result = .failure(.undefined)
        let endpointMock = EndpointMock()
        let result: Result<String> = await sut.request(endpointMock)
        switch result {
        case .success:
            XCTFail()
        case .failure(let error):
            XCTAssertEqual(error, NetworkError.undefined)
        }
    }
}
