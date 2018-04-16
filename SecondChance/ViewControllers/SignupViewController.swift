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
//    var pickerPic : UIImage? {
//        didSet {
//            guard let image = pickerPic else {return}
//            self.userImage = pickerPic
//
//        }
//    }
//

    //MARK: Outlets

    @IBOutlet weak var firstnameTF: HoshiTextField!
    @IBOutlet weak var lastnameTF: UIStackView!
    @IBOutlet weak var emailTF: HoshiTextField!
    @IBOutlet weak var passwordTF: HoshiTextField!
    @IBOutlet weak var birthdayText: HoshiTextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nextButton: GradientButton!
    
    
    //MARK: ACtions
  
    @IBAction func addProfilePic(_ sender: UIButton) {
        uploadPicture()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        hexagonalImage()
        hexagonalButton(hello: nextButton)
        
        
        
        
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
    
    
    func hexagonalImage() {
        let lineWidth: CGFloat = 0
        let path = UIBezierPath(polygonIn: userImage.bounds, sides: 6, lineWidth: lineWidth, cornerRadius: 10)
        
        let mask = CAShapeLayer()
        mask.path            = path.cgPath
        mask.lineWidth       = lineWidth
        mask.strokeColor     = UIColor.clear.cgColor
        mask.fillColor       = UIColor.white.cgColor
        userImage.layer.mask = mask
        
        let border = CAShapeLayer()
        border.path          = path.cgPath
        border.lineWidth     = lineWidth
        border.strokeColor   = UIColor.black.cgColor
        border.fillColor     = UIColor.clear.cgColor
        userImage.layer.addSublayer(border)
        
    }
    func hexagonalButton(hello: UIView ) {
        let lineWidth: CGFloat = 0
        let path = UIBezierPath(polygonIn: hello.bounds, sides: 6, lineWidth: lineWidth, cornerRadius: 10)
        
        let mask = CAShapeLayer()
        mask.path            = path.cgPath
        mask.lineWidth       = lineWidth
        mask.strokeColor     = UIColor.clear.cgColor
        mask.fillColor       = UIColor.white.cgColor
        hello.layer.mask = mask
        
        let border = CAShapeLayer()
        border.path          = path.cgPath
        border.lineWidth     = lineWidth
        border.strokeColor   = UIColor.black.cgColor
        border.fillColor     = UIColor.clear.cgColor
        hello.layer.addSublayer(border)
        
    }
    
    
    func uploadPicture() {
        
        let image = UIImagePickerController()
        image.allowsEditing = true
        image.sourceType = .photoLibrary
        image.delegate = self
        self.present(image,animated: true)
        
    }


}

extension SignupViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            userImage.image = editImage
        } else if let originaleImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userImage.image = originaleImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}




