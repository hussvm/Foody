//
//  Route.swift
//  Foody
//
//  Created by HUSSAM on 6/10/23.
//

import Foundation

enum Route {
    static let baseUrl = " Url For The Backend"
    
    case fetchAllCatgories
    case placeOrder(String)
    
    var description: String {
        switch self {
        case .fetchAllCatgories: return "/ Location for catgories from backend"
        case .placeOrder(let dishId): return "/ Location for Order in the backend\(dishId)"
        }
    }
}
