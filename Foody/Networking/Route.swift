//
//  Route.swift
//  Foody
//
//  Created by HUSSAM on 6/10/23.
//

import Foundation

enum Route {
    static let baseUrl = "Any Url From The Backend"
    case temp
    var description: String{
        switch self {
        case .temp: return "temp"
        }
    }
}
