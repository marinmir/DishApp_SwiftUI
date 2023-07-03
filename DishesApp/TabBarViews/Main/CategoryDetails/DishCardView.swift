//
//  DishCardView.swift
//  DishesApp
//
//  Created by Magina Marina on 01.07.2023.
//

import SwiftUI

struct DishCardView: View {
    let dish: Dish
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .center) {
                Color("grayBackground")
                    .frame(height: 109)
                    .cornerRadius(10)
                
                AsyncImage(
                    url: URL(string: dish.imageUrl),
                    content: { image in
                        image
                            .resizable()
                            .frame(maxWidth: 90, maxHeight: 90) //content issue
                            
                    },
                    placeholder: { ProgressView() })
            }

            Spacer()
                .frame(height: 5)
            
            Text(dish.name)
                .font(.system(size: 14, weight: .regular))
                .frame(alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .lineLimit(2)
        }
    }
}
