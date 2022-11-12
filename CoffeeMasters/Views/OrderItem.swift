//
//  OrderItem.swift
//  CoffeeMasters
//
//  Created by qiushi on 11/11/22.
//

import SwiftUI

import SwiftUI

struct OrderItem: View {
    var item: (Product, Int)
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        HStack {
            Text("\(item.1)x")
            Text(item.0.name)
            Spacer()
            Text("$ \(Double(item.1) * item.0.price, specifier: "%.2f")")
            Image(systemName: "trash")
                .font(.title)
                .foregroundColor(Color("Secondary"))
                .padding()
                .onTapGesture {
                    cartManager.remove(product: item.0)
                }
        }
    }
}

struct OrderItem_Previews: PreviewProvider {
    static var previews: some View {
        OrderItem(item: (demoProduct, 1))
            .padding()
            .environmentObject(CartManager())
    }
}
