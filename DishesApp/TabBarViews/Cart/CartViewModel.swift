//
//  CartViewModel.swift
//  DishesApp
//
//  Created by Magina Marina on 02.07.2023.
//

import Foundation

final class CartViewModel: ObservableObject {
    @Published var calculatedSum: String = "0"
    @Published private(set) var cartDishes: [Dish: Int] = [:]
    
    func addToCart(_ dish: Dish) {
        cartDishes[dish, default: 0] += 1
        calculateSum()
    }
    
    func removeFromCart(_ dish: Dish) {
        if cartDishes.contains(where: {
            $0.key == dish
        }) {
            if cartDishes[dish] == 1 {
                cartDishes[dish] = nil
            } else {
                cartDishes[dish]! -= 1
            }
        }
        
        calculateSum()
    }
    
    private func calculateSum() {
        let sum = cartDishes.reduce(0) {
           $0 + $1.value * $1.key.price
        }
        
        let formatter = NumberFormatter()
        formatter.groupingSeparator = " "
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        
        if let formattedSum = formatter.string(from: sum as NSNumber) {
            calculatedSum = formattedSum
        }
    }
}
