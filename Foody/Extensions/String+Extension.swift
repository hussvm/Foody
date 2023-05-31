//
//  String+Extension.swift
//  Foody
//
//  Created by HUSSAM on 5/31/23.
//

import Foundation
extension String {
    var asURL: URL? {
        return URL(string: self)
    }
    
}
