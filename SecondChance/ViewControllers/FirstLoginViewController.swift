//
//  FirstLoginViewController.swift
//  SecondChance
//
//  Created by macbook on 29/03/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import TextFieldEffects


class FirstLoginViewController: UIViewController {

     //MARK: Propreties
    
    //MARK: OUTLETS
   
    @IBOutlet weak var professionText: HoshiTextField!
    @IBOutlet weak var universityText: HoshiTextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var nextButton: GradientButton!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        hexagonalButton()
       SecondChance.hexagonalButton(hello: nextButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func hexagonalButton() {
//        let lineWidth: CGFloat = 0
//        let path = UIBezierPath(polygonIn: nextB.bounds, sides: 6, lineWidth: lineWidth, cornerRadius: 10)
//        
//        let mask = CAShapeLayer()
//        mask.path            = path.cgPath
//        mask.lineWidth       = lineWidth
//        mask.strokeColor     = UIColor.clear.cgColor
//        mask.fillColor       = UIColor.white.cgColor
//        nextB.layer.mask = mask
//        
//        let border = CAShapeLayer()
//        border.path          = path.cgPath
//        border.lineWidth     = lineWidth
//        border.strokeColor   = UIColor.black.cgColor
//        border.fillColor     = UIColor.clear.cgColor
//        nextB.layer.addSublayer(border)
//        
//    }
    

 

}
