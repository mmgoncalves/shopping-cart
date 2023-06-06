//
//  Double+Extension.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 06/06/23.
//

import Foundation

extension Double {
    var currencyFormat: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.currencyDecimalSeparator = ","
        let stringFormat = formatter.string(for: self) ?? ""
        return stringFormat
    }
}
