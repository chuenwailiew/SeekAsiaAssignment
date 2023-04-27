//
//  BaseColor.swift
//  SeekAsiaAssignment
//
//  Created by Chuen Wai Liew on 24/04/2023.
//

import Foundation
import UIKit

extension UIColor {
    static let BackgroundBrand = UIColor(with: "#0D3880")
    static let BackgroundSecondary = UIColor(with: "#EFF3FB")
    static let CardBackground = UIColor(with: "#FFFFFF")
    static let TextPrimary = UIColor(with: "#333A49")
    static let TextSecondary = UIColor(with: "#69768C")
    static let TextReversed = UIColor(with: "#FFFFFF")
    static let Button = UIColor(with: "#2765CF")
    
    /// pass in hex string to get the exact color
    convenience init(with hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init()
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
