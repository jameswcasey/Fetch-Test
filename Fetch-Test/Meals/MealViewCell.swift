//
//  MealViewCell.swift
//  Fetch-Test
//
//  Created by James Casey on 9/4/24.
//

import SwiftUI

struct MealViewCell: View {
    let meal: Meal
    
    var body: some View {
        HStack {
            AsyncImage(url: meal.imageURL) { result in
                result.image?
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .frame(height: 50)
            Text(meal.strMeal)
        }
    }
}

#Preview {
    MealViewCell(meal: Meal(strMeal: "", idMeal: "", strMealThumb: ""))
}
