//
//  CartManager.swift
//  CoffeeMasters
//
//  Created by qiushi on 11/11/22.
//

import Foundation

class CartManager: ObservableObject {
    @Published var products: [(Product, Int)] = []
        
    func add(product: Product, quantity: Int) {
        products.append((product, quantity))
    }
        
    func remove(product: Product) {
        products.removeAll { productInCart in
            productInCart.0.id == product.id
        }
    }
    
    func clear() {
        products.removeAll()
    }
    
    func total() -> Double {
        var total = 0.0
        for item in products {
            total += item.0.price * Double(item.1)
        }
        return total
    }
}
