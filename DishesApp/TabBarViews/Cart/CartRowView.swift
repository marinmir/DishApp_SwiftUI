//
//  CartRowView.swift
//  DishesApp
//
//  Created by Magina Marina on 02.07.2023.
//

import SwiftUI

struct CartRowView: View {
    let dish: Dish
    let count: Int
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        HStack {
            ZStack {
                Color("grayBackground")
                    .frame(width: 62, height: 62)
                
                AsyncImage(
                    url: URL(string: dish.imageUrl),
                    content: { image in
                        image
                            .resizable()
                            .frame(maxWidth: 48, maxHeight: 48)
                            
                    },
                    placeholder: { ProgressView() })
            }
            .cornerRadius(6)
            
            Spacer()
                .frame(width: 8)
            
            VStack(alignment: .leading) {
                Text("\(dish.name)")
                    .foregroundColor(.black)
                
                Spacer()
                    .frame(height: 0)
                
                HStack {
                    Text("\(dish.price) ₽")
                    
                    Spacer()
                        .frame(width: 0)
                    
                    Text(" · ")
                        .foregroundColor(.black.opacity(0.4))
                    
                    Spacer()
                        .frame(width: 0)
                    
                    Text("\(dish.weight)г")
                        .foregroundColor(.black.opacity(0.4))
                    
                    Spacer()
                }
            }
            .font(.system(size: 14, weight: .regular))
            .frame(alignment: .leading)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            
            Spacer()
            
            HStack {
                Button(action: {
                    cartViewModel.removeFromCart(dish)
                }) {
                    Image("minusButton")
                        .frame(width: 24, height: 24)
                }
                
                Spacer()
                    .frame(maxWidth: 16)
                
                Text("\(count)")
                    .font(.system(size: 14, weight: .medium))
                
                Spacer()
                    .frame(maxWidth: 16)
                
                Button(action: {
                    cartViewModel.addToCart(dish)
                }) {
                    Image("plusButton")
                        .frame(width: 24, height: 24)
                }
            }
            .frame(width: 99, height: 32)
            .background(Color("grayBackground"))
            .cornerRadius(10)
            
        }
        .frame(height: 62)
    }
}
