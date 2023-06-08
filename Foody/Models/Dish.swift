//
//  Dish.swift
//  Foody
//
//  Created by HUSSAM on 6/1/23.
//

import Foundation

struct Dish {
    let id, name, image, description: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) Calories "
    }
    
}
