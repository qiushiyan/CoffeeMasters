//
//  Category.swift
//  CoffeeMasters
//
//  Created by qiushi on 11/11/22.
//

import Foundation

struct Category: Decodable, Identifiable {
    var name: String
    var products: [Product]
    var id: String {
        return self.name
    }
    
    
    func filteredProducts(text: String) -> [Product] {
        if text.count != 0 {
            return products.filter({ product in
                return product.name.contains(text)
            })
        } else {
            return products
        }
    }
}
