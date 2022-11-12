//
//  Product.swift
//  CoffeeMasters
//
//  Created by qiushi on 11/11/22.
//

import Foundation

struct Product: Decodable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var image: String

    var imageURL: URL {
        URL(string: "https://firtman.github.io/coffeemasters/api/images/\(self.image)")!
    }
}


let demoProduct = Product(id: 0, name: "Black Americano", description: "Freshly pulled shots of espresso combined with hot water.", price: 1.5, image: "blackamericano.png")

