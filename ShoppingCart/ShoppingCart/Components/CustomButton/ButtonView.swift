//
//  ButtonView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 26/08/23.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Color.green
            Button {
                action()
            } label: {
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.defaultFont(18))
            }
        }
        .frame(height: 50)
        .cornerRadius(8)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Confirmar", action: {
            print("ButtonView Action")
        })
    }
}
