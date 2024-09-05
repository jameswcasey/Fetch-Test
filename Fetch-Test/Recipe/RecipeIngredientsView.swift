//
//  RecipeIngredientsView.swift
//  Fetch-Test
//
//  Created by James Casey on 9/4/24.
//

import SwiftUI

struct RecipeIngredientsView: View {
    let recipe: Recipe
    
    var body: some View {
        Section {
            ForEach(recipe.ingredients) { ingredient in
                Text(ingredient.text)
            }
        } header: {
            Text("Ingredients")
                .font(.title2)
        }
    }
}

#Preview {
    RecipeIngredientsView(recipe: Recipe(dataModel: RecipeDataModel.testingVariation))
}
