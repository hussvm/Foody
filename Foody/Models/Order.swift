//
//  Order.swift
//  Foody
//
//  Created by HUSSAM on 6/8/23.
//

import Foundation

struct Order: Decodable{
    let id,name: String?
    let dish: Dish?
}
