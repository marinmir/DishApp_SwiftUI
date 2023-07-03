//
//  Dish.swift
//  DishesApp
//
//  Created by Magina Marina on 01.07.2023.
//

import Foundation

struct Dish: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let imageUrl: String
    let tegs: [String] // typo in API
}

struct CategoryDetailsResponse: Decodable {
    let dishes: [Dish]
}
