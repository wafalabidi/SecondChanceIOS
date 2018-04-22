//
//  Extension.swift
//  SecondChance
//
//  Created by macbook on 14/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

extension UIBezierPath {
    
    convenience init(polygonIn rect: CGRect, sides: Int, lineWidth: CGFloat = 1, cornerRadius: CGFloat = 0) {
        self.init()
        
        let theta = 2 * CGFloat.pi / CGFloat(sides)                 // how much to turn at every corner
        let offset = cornerRadius * tan(theta / 2)                  // offset from which to start rounding corners
        let squareWidth = min(rect.size.width, rect.size.height)    // width of the square
        
        // calculate the length of the sides of the polygon
        
        var length = squareWidth - lineWidth
        if sides % 4 != 0 {                                         // if not dealing with polygon which will be square with all sides ...
            length = length * cos(theta / 2) + offset / 2           // ... offset it inside a circle inside the square
        }
        let sideLength = length * tan(theta / 2)
        
        // if you'd like to start rotated 90 degrees, use these lines instead of the following two
        //
        // var point = CGPoint(x: rect.midX - length / 2, y: rect.midY + sideLength / 2 - offset)
        // var angle = -CGFloat.pi / 2.0
        
        var point = CGPoint(x: rect.midX + sideLength / 2 - offset, y: rect.midY + length / 2)
        var angle = CGFloat.pi
        
        move(to: point)
        
        // draw the sides and rounded corners of the polygon
        
        for _ in 0 ..< sides {
            point = CGPoint(x: point.x + (sideLength - offset * 2) * cos(angle), y: point.y + (sideLength - offset * 2) * sin(angle))
            addLine(to: point)
            
            let center = CGPoint(x: point.x + cornerRadius * cos(angle + .pi / 2), y: point.y + cornerRadius * sin(angle + .pi / 2))
            addArc(withCenter: center, radius: cornerRadius, startAngle: angle - .pi / 2, endAngle: angle + theta - .pi / 2, clockwise: true)
            
            point = currentPoint
            angle += theta
        }
        
        close()
        
        self.lineWidth = lineWidth           // in case we're going to use CoreGraphics to stroke path, rather than CAShapeLayer
        lineJoinStyle = .round
    }
    
}


extension String {
    
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension JSON {
    
    var toBool: Bool? {
        if let bool = self.bool { return bool }
        if let int = self.toInt {
            if int == 0 {
                return false
            } else if int == 1 {
                return true
            }
        }
        
        return nil
    }
    
    var toInt: Int? {
        if let int = self.int { return int }
        if let string = self.string, let int = Int(string) {
            return int
        }
        
        return nil
    }
    
    var toImagePath: String? {
        guard let string = self.string, !string.isEmpty else { return nil }
        
        return URLS.file_root + string
    }
    
}

