//
//  MenuPage.swift
//  CoffeeMasters
//
//  Created by qiushi on 11/11/22.
//

import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager: MenuManager
    @State var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(menuManager.menu) { category in
                    Section {
                        if category.filteredProducts(text: searchText).count > 0 {
                            Text(category.name.capitalized).font(.title3)
                        }
                        ForEach(category.filteredProducts(text: searchText)) { product in
                            NavigationLink {
                                ProductDetails(product: product)
                            } label: {
                                ProductItem(product: product)
                            }
                        }
                    }
                }
            }.navigationTitle("Products").searchable(text: $searchText)
        }
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
            .environmentObject(MenuManager())
            .environmentObject(LikesManager())
    }
}
