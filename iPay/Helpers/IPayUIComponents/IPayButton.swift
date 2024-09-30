//
//  IPayButton.swift
//  iPay
//
//  Created by Aung Kyaw Phyo on 30/09/2024.
//

import UIKit

@IBDesignable
class IPayButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        self.setTitleColor(.appColor(.btnTextColor), for: .normal)
        self.backgroundColor = .appColor(.primaryColor)
        self.layer.cornerRadius = 22
    }
    
}

