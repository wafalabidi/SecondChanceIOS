//
//  GradientButton.swift
//  SecondChance
//
//  Created by macbook on 14/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
@IBDesignable
class GradientButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    // Default gradient is horizontal.
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.5)
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.5)
    
    // Allow selection from predefined directions.
    // See documentation for more details.
    @IBInspectable var usePrefinedDirection: Bool = false
    @IBInspectable var direction: Int = 0 {
        didSet {
            direction = abs(direction) % 8
        }
    }
    
    @IBInspectable var startColour: UIColor?
    @IBInspectable var endColour: UIColor?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let startColour = startColour, let endColour = endColour {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [startColour.cgColor, endColour.cgColor]
            gradientLayer.frame = self.bounds
            
            if usePrefinedDirection {
                switch direction {
                case 1:
                    gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                case 2:
                    gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                    gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
                case 3:
                    gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
                    gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
                case 4:
                    gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
                    gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
                case 5:
                    gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
                    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
                case 6:
                    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
                case 7:
                    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
                    gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
                default:
                    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                }
            } else {
                gradientLayer.startPoint = startPoint
                gradientLayer.endPoint = endPoint
            }
            
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
}
