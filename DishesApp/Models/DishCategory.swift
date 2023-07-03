//
//  DishCategory.swift
//  DishesApp
//
//  Created by Magina Marina on 30.06.2023.
//

import Foundation

struct DishCategory: Hashable, Codable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
}

struct DishCategoriesResponse: Decodable {
    let categories: [DishCategory]
    
    enum CodingKeys: String, CodingKey {
        case categories = "сategories" // thanks for the russian "с"
    }
}
