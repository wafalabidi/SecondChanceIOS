//
//  SignupViewController.swift
//  SecondChance
//
//  Created by macbook on 14/03/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import UIKit
import TextFieldEffects
import TransitionButton

class SignupViewController: UIViewController {

    //MARK: Propreties
    let datePicker = UIDatePicker()

    //MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var birthdayText: HoshiTextField!
    //MARK: ACtions
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Visual Effect View for background
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.dark)) as UIVisualEffectView
        visualEffectView.frame = self.view.frame
        visualEffectView.alpha = 0.5
        imageView.image = #imageLiteral(resourceName: "Happy-Couple-app-579e5e9f3df78c32768a8cce-2")
        imageView.addSubview(visualEffectView)
        
        createDatePicker()
    }


    
    func createDatePicker() {
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        birthdayText.inputAccessoryView = toolbar
        birthdayText.inputView = datePicker
        
        
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        birthdayText.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }



}
