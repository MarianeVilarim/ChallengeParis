//
//  UIColor.swift
//  dor
//
//  Created by MLaura on 20/09/22.
//

import UIKit
extension UIColor {
    
    static let onboardingPurple = UIColor(red: 91, green: 48, blue: 190, a:1.0)
    static let onboardingYellow = UIColor(red: 255, green: 200, blue: 46, a:1.0)
    static let onboardingGreen = UIColor(red: 0 , green: 198, blue: 170 , a:1.0)
    static let onboardingOrange = UIColor(red: 255, green: 128, blue: 54, a:1.0)
   
    convenience init(red: Int, green: Int, blue: Int, a:CGFloat = 1.0) {
        self.init(
            red: CGFloat(red)/255.0,
            green: CGFloat(green)/255.0,
            blue: CGFloat(blue)/255.0,
            alpha: a
        )
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0 ){
        self.init(
            red:(hex >> 16) & 0xFF,
            green:(hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
            )
        }
    
    
}

