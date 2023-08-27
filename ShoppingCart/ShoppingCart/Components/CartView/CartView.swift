//
//  CartView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 26/08/23.
//

import SwiftUI

struct CartView: View {
    @State var total: Int
    
    var body: some View {
        ZStack {
            Image(systemName: total == 0 ? "cart": "cart.fill")
                .resizable()
                .foregroundColor(.init(uiColor: total == 0 ? .lightGray: .systemBlue))
                .frame(width: 33, height: 33)
            if total > 0 {
                Group {
                    Text(total == 0 ? "" : String(total))
                        .font(.defaultFont(10))
                        .foregroundColor(.white)
                }
                .padding(4)
                .background(Color(uiColor: .systemBlue))
                .cornerRadius(9)
                .offset(x: -10, y: 10)
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(
            total: 10
        )
    }
}
