//
//  RecipeView.swift
//  Fetch-Test
//
//  Created by James Casey on 9/4/24.
//

import SwiftUI

struct RecipeView: View {
    @StateObject private var viewModel: RecipeViewModel
    
    init(mealID: String) {
        self._viewModel = StateObject(wrappedValue: RecipeViewModel(mealID: mealID))
    }
    
    var body: some View {
        VStack {
            if viewModel.loading {
                Text("Loading...")
            } else if let recipe = viewModel.recipe {
                List {
                    AsyncImage(url: recipe.imageURL) { result in
                        result.image?
                            .resizable()
                            .frame(height: 200)
                    }
                    .frame(height: 200)
                    .listRowSeparator(.hidden)
                    HStack {
                        Text(recipe.mealName)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .listRowSeparator(.hidden)
                    Text(recipe.instructions)
                        .listRowSeparator(.hidden)
                    RecipeIngredientsView(recipe: recipe)
                    RecipeMeasurementsView(recipe: recipe)
                }
                .listStyle(.plain)
            } else {
                Text("Something went wrong...")
                    .font(.title)
            }
        }
        .task {
            await viewModel.fetchRecipe()
        }
    }
}

#Preview {
    RecipeView(mealID: "")
}
