//
//  UIFont+Extension.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 01/06/23.
//

import UIKit
import SwiftUI

extension UIFont {
    static func defaultFont(_ size: CGFloat = 14) -> UIFont {
        UIFont(name: "arial", size: size)!
    }
}

extension Font {
    static func defaultFont(_ size: CGFloat = 14) -> Font {
        Font.custom("arial", size: size)
    }
}
