//
//  HomeCardList.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 27/08/23.
//

import SwiftUI

struct HomeCardList: View {
    let products: [Product]
    let didTapAdd: (_ product: Product) -> Void
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    .init(.flexible()),
                    .init(.flexible())
                ]
            ) {
                ForEach(products) { product in
                    HomeCard(product: product) { product in
                        didTapAdd(product)
                    }
                }
            }
            .padding(10)
        }
    }
}

struct HomeCardList_Preview: PreviewProvider {
    static var previews: some View {
        HomeCardList(
            products: [
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
                .mock,
            ],
            didTapAdd: { prod in
                print("Did Tap add ", prod.name)
            }
        )
    }
}
