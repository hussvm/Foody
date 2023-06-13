//
//  AllDihes.swift
//  Foody
//
//  Created by HUSSAM on 6/13/23.
//

import Foundation

struct AllDihes: Decodable {
    let catgories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
