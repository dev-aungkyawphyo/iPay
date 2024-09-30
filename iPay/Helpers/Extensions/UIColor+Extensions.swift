//
//  UIColor+Extensions.swift
//  iPay
//
//  Created by Aung Kyaw Phyo on 30/09/2024.
//

import UIKit

extension UIColor {
    
    static func appColor(_ name: AssetColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
    
}
