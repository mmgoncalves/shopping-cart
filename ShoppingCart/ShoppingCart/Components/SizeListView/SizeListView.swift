//
//  SizeListView.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 26/08/23.
//

import SwiftUI

struct SizeListView: View {
    let sizes: [Size]
    private var sizeFormatted: String {
        sizes.compactMap({ "\($0.size)" }).joined(separator: " - ")
    }
    
    var body: some View {
        Text(sizeFormatted)
            .font(.defaultFont(12))
            .foregroundColor(.init(uiColor: .darkGray))
    }
}

struct SizeListView_Previews: PreviewProvider {
    static var previews: some View {
        SizeListView(
            sizes: [
                .mock(size: "PP"),
                .mock(size: "M"),
                .mock(size: "GG")
            ]
        )
    }
}
