//
//  hexagonalShape.swift
//  SecondChance
//
//  Created by macbook on 15/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit


    
    
    func hexagonalButton(button: UIView ) {
        let lineWidth: CGFloat = 0
        let path = UIBezierPath(polygonIn: button.bounds, sides: 6, lineWidth: lineWidth, cornerRadius: 5)
        
        let mask = CAShapeLayer()
        mask.path            = path.cgPath
        mask.lineWidth       = lineWidth
        mask.strokeColor     = UIColor.clear.cgColor
        mask.fillColor       = UIColor.white.cgColor
        button.layer.mask = mask
        
        let border = CAShapeLayer()
        border.path          = path.cgPath
        border.lineWidth     = lineWidth
        border.strokeColor   = UIColor.black.cgColor
        border.fillColor     = UIColor.clear.cgColor
        button.layer.addSublayer(border)
        
    
    
}
