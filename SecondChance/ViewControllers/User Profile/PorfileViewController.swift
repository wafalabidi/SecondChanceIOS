//
//  PorfileViewController.swift
//  SecondChance
//
//  Created by macbook on 14/03/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class PorfileViewController: UIViewController{
    
    //MARK: Propreties
    var views: [UIView]!
    //MARK: OUTLETS
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var userPicture: UIImageView!
    //MARK: ACTIONS
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        self.viewContainer.bringSubview(toFront: views[sender.selectedSegmentIndex])
    }


    override func viewDidLoad() {
        super .viewDidLoad()
        
        switchView()
        hexagonalImage()
    }
    
    //MARK: Functions
    
    func switchView() {
        
        views = [UIView]()
        views.append(GridPicViewController().view)
        views.append(UserInfoViewController().view)
        for v in views {
            viewContainer.addSubview(v)
        }
        viewContainer.bringSubview(toFront: views[0])
    }
    
    func hexagonalImage() {
        let lineWidth: CGFloat = 0
        let path = UIBezierPath(polygonIn: userPicture.bounds, sides: 6, lineWidth: lineWidth, cornerRadius: 10)
        
        let mask = CAShapeLayer()
        mask.path            = path.cgPath
        mask.lineWidth       = lineWidth
        mask.strokeColor     = UIColor.clear.cgColor
        mask.fillColor       = UIColor.white.cgColor
        userPicture.layer.mask = mask
        
        let border = CAShapeLayer()
        border.path          = path.cgPath
        border.lineWidth     = lineWidth
        border.strokeColor   = UIColor.black.cgColor
        border.fillColor     = UIColor.clear.cgColor
        userPicture.layer.addSublayer(border)
        
    }
  
    
}
