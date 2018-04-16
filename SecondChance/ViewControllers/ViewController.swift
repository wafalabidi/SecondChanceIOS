//
//  ViewController.swift
//  SecondChance
//
//  Created by macbook on 12/03/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    //MARK: BUTTONS

    @IBAction func signUp(_ sender: UIButton) {
        signUpButton.isHidden = true
        loginButton.isHidden = true
    }
    
    
    @IBAction func login(_ sender: UIButton) {
        signUpButton.isHidden = true
        loginButton.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }


}

