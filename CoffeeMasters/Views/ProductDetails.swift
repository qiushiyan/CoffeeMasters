//
//  ProductDetails.swift
//  CoffeeMasters
//
//  Created by qiushi on 11/11/22.
//

import SwiftUI

struct ProductDetails: View {
    @State var quantity = 1
    var product: Product
    @EnvironmentObject() var cartManager: CartManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ScrollView {
                AsyncImage(url: product.imageURL)
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity, idealHeight: 150, maxHeight: 150)
                    .padding(.top, 32)
                Text(product.name)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .padding(24)
                HStack {
                    Text("$ \(product.price, specifier: "%.2f")")
                    Stepper(value: $quantity, in: 1 ... 10) {}
                }
                .frame(maxWidth: .infinity)
                .padding(30)

                Text("Total: $ \(product.price * Double(quantity), specifier: "%.2f")")
                    .bold()
                    .padding(12)

                Button("Add \(quantity) to Cart") {
                    cartManager.add(product: product, quantity: quantity)
                    dismiss()
                }
                .padding()
                .frame(width: 250.0)
                .background(Color("Primary"))
                .foregroundColor(Color.black)
                .cornerRadius(25)
            }
        }.navigationTitle(product.name)
            .toolbar {
                LikeButton(product: product)
            }
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(product: demoProduct).environmentObject(CartManager()).environmentObject(LikesManager())
    }
}
