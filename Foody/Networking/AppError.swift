//
//  AppError.swift
//  Foody
//
//  Created by HUSSAM on 6/11/23.
//

import Foundation

enum AppError: LocalizedError{
    case errorDecoding
    case unkownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
            
        case .errorDecoding:
            return "Respone Could not be Decoded"
        case .unkownError:
            return "Error 404"
        case .invalidUrl:
            return "Enter Valid URL"
        case .serverError(let error):
            return error
        }
    }
}
