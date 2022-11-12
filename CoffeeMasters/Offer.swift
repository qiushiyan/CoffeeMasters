//
//  Offer.swift
//  CoffeeMasters
//
//  Created by qiushi on 11/11/22.
//

import SwiftUI

struct Offer: View {
    var title = ""
    var description = ""

    var body: some View {
        ZStack {
            Image("BackgroundPattern")
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
            VStack {
                Text(title)
                    .font(.title)
                    .padding(10)
                    .background(Color("Info"))
                Text(description)
            }
        }.padding(.bottom, 20)
    }
}

struct Offer_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Offer(title: "hello", description: "how are you")
        }
    }
}
