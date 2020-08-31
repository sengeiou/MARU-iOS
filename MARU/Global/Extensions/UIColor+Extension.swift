//
//  UIColor+Extension.swift
//  MARU
//
//  Created by 오준현 on 2020/08/16.
//  Copyright © 2020 maru. All rights reserved.
//

import UIKit

extension UIColor {
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    @nonobjc class var black22: UIColor {
      return UIColor(white: 34.0 / 255.0, alpha: 0.22)
    }
    @nonobjc class var black2: UIColor {
      return UIColor(red: 44, green: 44, blue: 44)
    }

    @nonobjc class var black: UIColor {
      return UIColor(white: 52.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var cornflowerBlue: UIColor {
      return UIColor(red: 65.0 / 255.0, green: 105.0 / 255.0, blue: 225.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var veryLightPink: UIColor {
      return UIColor(white: 209.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var veryLightPinkTwo: UIColor {
      return UIColor(white: 235.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var brownishGrey: UIColor {
      return UIColor(white: 112.0 / 255.0, alpha: 1.0)
    }


}
