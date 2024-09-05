//
//  Meals.swift
//  Fetch-Test
//
//  Created by James Casey on 9/4/24.
//

import Foundation

struct Meals: Decodable {
    let meals: [Meal]
}

struct Meal: Identifiable, Decodable {
    var id: String {
        idMeal
    }
    
    let strMeal: String
    
    let idMeal: String
    
    let strMealThumb: String
    
    var imageURL: URL? {
        URL(string: strMealThumb)
    }
}
