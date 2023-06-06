//
//  NetworkError.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 30/05/23.
//

public enum NetworkError: Int, Error {
    case badRequest = 400
    case forbidden = 403
    case serverError = 500
    case undefined = 0
    case parse = 9999
    case endpointNotExist = -1
}
