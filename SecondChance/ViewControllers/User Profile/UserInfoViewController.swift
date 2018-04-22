//
//  UserInfoViewController.swift
//  SecondChance
//
//  Created by macbook on 15/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import TextFieldEffects

class UserInfoViewController: UIViewController,BEMCheckBoxDelegate {
    
    //MARK:Propreties
    var user: User?
    //MARK: OUTLETS
    @IBOutlet weak var buttonShape: GradientButton!
//    @IBOutlet weak var workTextField: HoshiTextField!
//    @IBOutlet weak var countryTextField: HoshiTextField!
//    @IBOutlet weak var townTextField: HoshiTextField!
//    @IBOutlet weak var universitiyTextField: HoshiTextField!
//    @IBOutlet weak var numberOfChildTextField: HoshiTextField!
//    @IBOutlet weak var descriptionTextView: UITextView!
//    @IBOutlet weak var statusTextField: HoshiTextField!
    
    
    

    
    //MARK: ACTIONS
    @IBAction func checkButton(_ sender: UIButton) {
//        print("nehe")
//        let work = workTextField.text
//        let country = countryTextField.text
//        let town = townTextField.text
//        let university = universitiyTextField.text
//        let numberOfchild = Int(universitiyTextField.text!)
//        let description = descriptionTextView.text
//        let status = statusTextField.text
//        
//        API.editUserInfo(description: description!, university: university!, work: work!, country: country!, town: town!, numberOfChild: numberOfchild!, status: status!, age: 20, gender: "Woman", liveAlone: true)
//        { (error:Error?,success:Bool ) in
//            if(success){
//                print("sahiti")
//            }
//            else {
//                print(error!)
//            }
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        hexagonalButton(button: buttonShape)
        view.isUserInteractionEnabled = true

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
