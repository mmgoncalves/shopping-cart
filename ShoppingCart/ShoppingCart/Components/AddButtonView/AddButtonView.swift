//
//  AddButtonView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 27/08/23.
//

import SwiftUI

struct AddButtonView: View {
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(
            action: {
                print("Action")
            }
        )
    }
}
