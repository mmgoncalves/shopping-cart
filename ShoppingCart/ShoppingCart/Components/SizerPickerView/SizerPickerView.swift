//
//  SizerPickerView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 26/08/23.
//

import SwiftUI
import Combine

struct SizerPickerView: View {
    private let product: Product
    private let action: (_ size: Size) -> Void
    @State private var selectedSize: String = ""
    
    init(product: Product, selectAction: @escaping (_ size: Size) -> Void) {
        self.product = product
        self.action = selectAction
    }
    
    var body: some View {
        LazyVStack {
            Text("Tamanhos disponíveis:")
                .font(.defaultFont(24))
                .foregroundColor(.init(uiColor: .darkGray))
            Picker("Escolha o tamanho", selection: $selectedSize) {
                ForEach(product.onlyAvailable) { size in
                    Text(size.size)
                        .tag(size.size)
                        .foregroundColor(.init(uiColor: .darkGray))
                        .font(.defaultFont(18))
                }
            }
            .pickerStyle(.wheel)
            ButtonView(title: "Confirmar", action: {
                if let size = product.onlyAvailable.first(where: { $0.size == selectedSize }) {
                    action(size)
                } else {
                    print("No size found")
                }
            })
        }
        .onAppear {
            selectedSize = product.onlyAvailable.first?.size ?? ""
        }
    }
}

struct SizerPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SizerPickerView(product: Product.mock, selectAction: {
            print("Selected size: ", $0.size)
        })
    }
}
