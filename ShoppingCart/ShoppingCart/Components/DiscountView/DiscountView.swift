//
//  DiscountView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 26/08/23.
//

import SwiftUI

struct DiscountView: View {
    let discountPercentage: String
    
    var body: some View {
        Group {
            Text(discountPercentage + " off")
                .font(.defaultFont())
                .foregroundColor(.white)
        }
        .padding(8)
        .background(.red)
        .cornerRadius(4)
    }
}

struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountView(
            discountPercentage: "37%"
        )
    }
}
