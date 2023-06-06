//
//  UIViewController+Extension.swift
//  Foody
//
//  Created by HUSSAM on 6/6/23.
//

import UIKit

extension UIViewController {
    static var idenitier: String {
        return String(describing: self)
    }
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: idenitier) as! Self
        return controller
    }
}
