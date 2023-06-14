//
//  UserDefualts+Extension.swift
//  Foody
//
//  Created by HUSSAM on 6/14/23.
//

import Foundation

extension UserDefaults {
    private enum UserDefualtsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get { bool(forKey: UserDefualtsKeys.hasOnboarded.rawValue)}
        
        set{ set(newValue, forKey: UserDefualtsKeys.hasOnboarded.rawValue)}
    }
}
