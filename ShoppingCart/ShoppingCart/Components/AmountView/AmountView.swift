//
//  AmountView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 26/08/23.
//

import SwiftUI

struct AmountView: View {
    let regularPrice: String
    let actualPrice: String
    let onSale: Bool
    
    var body: some View {
        LazyHStack(spacing: 5) {
            Image(systemName: "tag.square")
                .resizable()
                .foregroundColor(.init(uiColor: .systemBlue))
                .frame(width: 33, height: 33)
            LazyVStack(alignment: .leading) {
                Text(actualPrice)
                    .font(.defaultFont())
                    .foregroundColor(.init(uiColor: .darkGray))
                if onSale {
                    Text(regularPrice)
                        .font(.defaultFont(12))
                        .foregroundColor(.init(uiColor: .lightGray))
                        .strikethrough()
                }
            }
        }
    }
}

struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        AmountView(
            regularPrice: "R$100,00",
            actualPrice: "R$200,00",
            onSale: false
        )
    }
}
