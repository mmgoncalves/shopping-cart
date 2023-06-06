//
//  String+Extension.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 06/06/23.
//

import Foundation

extension String {
    var doubleValue: Double {
        let regex = "R\\s*\\$\\s*(\\d*(?:,\\d{1,2})?)"
        let replaced = replacingOccurrences(of: regex, with: "$1", options: .regularExpression).replacingOccurrences(of: ",", with: ".")
        return Double(replaced) ?? 0
    }
}
