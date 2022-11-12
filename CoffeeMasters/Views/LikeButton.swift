//
//  LikeButton.swift
//  CoffeeMasters
//
//  Created by qiushi on 11/12/22.
//

import SwiftUI

struct LikeButton: View {
    @EnvironmentObject var likesManager: LikesManager
    
    var product: Product
    
    var body: some View {
        Image(systemName: likesManager.isLiked(id: product.id) ? "heart.fill" : "heart")
            .padding()
            .foregroundColor(Color("Primary"))
            .accessibilityLabel(likesManager.isLiked(id: product.id) ? "Dislike" : "Like")
            .onTapGesture {
                likesManager.toggle(product.id)
            }
    }
}


struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(product: demoProduct).environmentObject(LikesManager())
    }
}
