//
//  SecondLoginViewController.swift
//  SecondChance
//
//  Created by macbook on 14/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import TextFieldEffects
import DLRadioButton

class SecondLoginViewController: UIViewController {
    
    //MARK:Propreties
    var livingAloneVal  = ""
    var statusVal = ""
    
    //MARK:OUTLETS
    @IBOutlet weak var countryTextField: HoshiTextField!
    @IBOutlet weak var townTextField: HoshiTextField!
    @IBOutlet weak var livingAlone: DLRadioButton!
    @IBOutlet weak var status: DLRadioButton!
    @IBOutlet weak var doneButton: GradientButton!
    
    
    //MARK:ACTIONS
    
    @IBAction func livingAloneAction(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            statusVal = (sender.titleLabel?.text)!
        } else {
            statusVal = (sender.titleLabel?.text)!
        }
        
    }
    @IBAction func statusAction(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            livingAloneVal = (sender.titleLabel?.text)!
        }
        else if sender.tag == 2 {
            livingAloneVal = (sender.titleLabel?.text)!
            
        }
        else if sender.tag == 3 {
            livingAloneVal = (sender.titleLabel?.text)!
        }
        else {
            livingAloneVal = (sender.titleLabel?.text)!
        }
        
        print(livingAloneVal)
        
    }
    
    @IBAction func doneButtonAction(_ sender: GradientButton) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Button Shape
        hexagonalButton(button: doneButton)
        

        
    }
    
    func createCountryPicker() {
        
        
        
    }
    
  
    
}

