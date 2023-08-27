//
//  LoadingView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 26/08/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.2)
                .ignoresSafeArea()
            ProgressView()
                .tint(.init(uiColor: .systemGreen))
                .controlSize(.large)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
