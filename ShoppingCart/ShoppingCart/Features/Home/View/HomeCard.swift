//
//  HomeCard.swift
//  ShoppingCart
//
//  Created by Mateus Marques on 27/08/23.
//

import SwiftUI

struct HomeCard: View {
    let product: Product
    let addAction: (_ product: Product) -> Void
    
    var body: some View {
        Group {
            VStack {
                Text(product.name)
                    .font(.defaultFont())
                    .foregroundColor(.init(uiColor: .darkGray))
                
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(minHeight: 130, maxHeight: 150)
                } placeholder: {
                    ProgressView()
                }
                HStack {
                    if product.onSale {
                        DiscountView(
                            discountPercentage: product.discountPercentage
                        )
                    }
                    Spacer()
                    AddButtonView {
                        addAction(product)
                    }
                }
                HStack {
                    AmountView(product: product)
                    Spacer()
                }
                HStack {
                    SizeListView(sizes: product.sizes)
                    Spacer()
                }
            }
            .padding(8)
            .cornerRadius(8)
            .frame(width: 170, height: 300)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(uiColor: .lightGray), lineWidth: 1)
            }
        }
    }
}

struct HomeCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeCard(
            product: .mock,
            addAction: {
                print("Did add => ", $0.name)
            }
        )
    }
}
