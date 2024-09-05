//
//  RecipeMeasurementsView.swift
//  Fetch-Test
//
//  Created by James Casey on 9/4/24.
//

import SwiftUI

struct RecipeMeasurementsView: View {
    let recipe: Recipe
    
    var body: some View {
        Section {
            ForEach(recipe.measurements) { measurement in
                Text(measurement.text)
            }
        } header: {
            Text("Measurements")
                .font(.title2)
        }
    }
}

#Preview {
    RecipeMeasurementsView(recipe: Recipe(dataModel: RecipeDataModel.testingVariation))
}
