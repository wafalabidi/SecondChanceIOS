//
//  SignupViewController.swift
//  SecondChance
//
//  Created by macbook on 17/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import TextFieldEffects
import DLRadioButton


class SignupViewController: UIViewController {

    //MAKR:Propreties
    let datePicker = UIDatePicker()
    var date = Date()
    let formatter = DateFormatter()

    
    //MARK:OUTLETS
    
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var firstName: HoshiTextField!
    @IBOutlet weak var lastName: HoshiTextField!
    @IBOutlet weak var password: HoshiTextField!
    @IBOutlet weak var email: HoshiTextField!
    @IBOutlet weak var birthday: HoshiTextField!
    @IBOutlet weak var nextB: GradientButton!
    @IBOutlet weak var sexButton: DLRadioButton!
    
    
    
    

    //MARK:ACTIONS
    
    @IBAction func nextButton(_ sender: GradientButton) {
        
        guard let firstName = firstName.text?.trimmed, !firstName.isEmpty else {return }
        guard let lastName = lastName.text?.trimmed, !lastName.isEmpty else {return }
        guard let email = email.text?.trimmed, !email.isEmpty else {return }
        guard let password = password.text, !password.isEmpty else {return }
        let birthdate = formatter.string(from: Date())
        API.register(firstname: firstName, lastname: lastName, email: email, password: password, birthdate: birthdate, username: email) { (error:Error?,success:Bool ) in
            if(success){
               print("sahiti")
            }
            else {
                print(error!)
            }
        }
    }
    
    @IBAction func uploadPic(_ sender: UIButton) {
        uploadPicture()
    }
    
    @IBAction func sexButtonAction(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            print("1")
        } else {

        }
        
    }
    
    var picker_image: UIImage? {
        didSet {
            // execute some code
            guard let image = picker_image else { return }
            
            // send to server
            API.createPhoto(photo: image) { (error: Error?, success: Bool) in
                if success {
                    // update collection view
                    
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hexagonalButton(button: nextB)
        hexagonalButton(button: userPic)
        createDatePicker()

    }
    
    
    
    func createDatePicker() {
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        birthday.inputAccessoryView = toolbar
        birthday.inputView = datePicker
        
        
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        birthday.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    func uploadPicture() {
        
        let image = UIImagePickerController()
        image.allowsEditing = true
        image.sourceType = .photoLibrary
        image.delegate = self
        self.present(image,animated: true)
        



        
    }
    

    
    
    

}


extension SignupViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            userPic.image = editImage
        } else if let originaleImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userPic.image = originaleImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
