//
//  UserInfoViewController.swift
//  SecondChance
//
//  Created by macbook on 15/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    
    @IBOutlet weak var buttonShape: GradientButton!
    

    @IBAction func checkButton(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hexagonalButton(button: buttonShape)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
