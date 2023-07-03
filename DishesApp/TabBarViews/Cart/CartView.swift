//
//  CartView.swift
//  DishesApp
//
//  Created by Magina Marina on 30.06.2023.
//

import SwiftUI

struct CartView: View {
    @Environment(\.profileImage) var profileImage
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    Spacer()
                        .frame(height: 16)
                    
                    
                    LazyVStack(spacing: 16) {
                        ForEach(Array(cartViewModel.cartDishes.keys), id: \.self) { dish in
                            CartRowView(dish: dish, count: cartViewModel.cartDishes[dish] ?? 0)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                VStack {
                    Spacer()
                    
                    if cartViewModel.calculatedSum != "0" {
                        Button(action: {
                            //do nothing
                        }) {
                            Text("Оплатить \(cartViewModel.calculatedSum) ₽")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 48)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .background(Color("AccentColor"))
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    profileImage
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    StatusView()
                }
            }
        }
    }
}
