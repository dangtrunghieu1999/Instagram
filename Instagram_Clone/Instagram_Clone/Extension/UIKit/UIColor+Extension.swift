//
//  UIColor+Extension.swift
//  Instagram_Clone
//
//  Created by Dang Trung Hieu on 9/4/20.
//  Copyright © 2020 Dang Trung Hieu. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var selectedColor: UIColor {
        return UIColor(hex: "#000000")
    }
    
    class var disableColor: UIColor {
         return UIColor(hex: "#7FCAFB")
    }
    
    class var enableColor: UIColor {
        return UIColor(hex: "#3897F0")
    }
    
    class var bodyColor: UIColor {
        return UIColor(hex: "#D8D8D8")
    }
    
    class var lineColor: UIColor {
        return UIColor(hex: "#EFEFEF")
    }
}


// MARK: - Support Method

extension UIColor {
    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.0)
            return
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: 1.0)
    }
}
