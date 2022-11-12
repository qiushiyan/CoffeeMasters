//
//  ContentView.swift
//  CoffeeMasters
//
//  Created by qiushi on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        TabView {
            MenuPage()
                .tabItem {
                    Image(systemName: "cup.and.saucer")
                    Text("Home")
                }

            OffersPage().tabItem {
                Image(systemName: "tag")
                Text("Offers")
            }

            OrdersPage().tabItem {
                Image(systemName: "cart")
                Text("Orders")
            }.badge(cartManager.products.count)

            InfoPage().tabItem {
                Image(systemName: "info.circle.fill")
                Text("Info")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CartManager())
            .environmentObject(MenuManager())
            .environmentObject(LikesManager())
    }
}
