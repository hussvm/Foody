//
//  ApiResponse.swift
//  Foody
//
//  Created by HUSSAM on 6/12/23.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
