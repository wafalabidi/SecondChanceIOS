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
    var user = [User]()

    
    //MARK: OUTLETS
   
    @IBOutlet weak var professionText: HoshiTextField!
    @IBOutlet weak var universityText: HoshiTextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var nextButton: GradientButton!
    
    @IBAction func nextButton(_ sender: GradientButton) {
        
        guard let profession = professionText.text?.trimmed, !profession.isEmpty else {return }
        guard let description = descriptionText.text?.trimmed, !description.isEmpty else {return }
        guard let university = universityText.text?.trimmed, !university.isEmpty else {return }
        
    
        API.editUser(id: Helper.getId()!, university: university, profession: profession, description: description) { (error: Error? , succes:Bool) in
            if (succes){
                print("haha")
            }
            else {
                print(error!)
            }
        }
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        hexagonalButton()
       SecondChance.hexagonalButton(button: nextButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    
    


 

}
