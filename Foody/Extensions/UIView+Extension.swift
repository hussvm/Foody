//
//  UIView+Extension.swift
//  Foody
//
//  Created by HUSSAM on 4/13/23.
//

import UIKit
extension UIView{
    @IBInspectable var cornerRadius : CGFloat{
        get{return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
