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
    
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func nextButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        let secondViewController:FirstLoginViewController = FirstLoginViewController()
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
