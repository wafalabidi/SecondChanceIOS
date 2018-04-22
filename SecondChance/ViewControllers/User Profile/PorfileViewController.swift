//
//  PorfileViewController.swift
//  SecondChance
//
//  Created by macbook on 14/03/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire
class PorfileViewController: UIViewController, BEMCheckBoxDelegate {
    
    var photo: Photo? {
        didSet {
            guard let photo = photo else { return }
            
            self.userPicture.image = #imageLiteral(resourceName: "cards_4")
            
            // download image
            Alamofire.request(photo.url).response { response in
                if let data = response.data, let image = UIImage(data: data) {
                    self.userPicture.image = image
                }
            }
        }
    }

    
    //MARK: Propreties
    
    var picker_image: UIImage? {
        didSet {
            // execute some code
            guard let image = picker_image else { return }
            
            // send to server
            API.createPhoto(photo: image) { (error: Error?, success: Bool) in
               
            }
        }
    }
    
    var views: [UIView]!
    var status: [BEMCheckBox]?
    var photos = [Photo]()

    
    //MARK: OUTLETS
    
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var numberOfChildTextField: HoshiTextField!
    @IBOutlet weak var townTextField: HoshiTextField!
    @IBOutlet weak var countryTextField: HoshiTextField!
    @IBOutlet weak var universityTextField: HoshiTextField!
    @IBOutlet weak var workTextField: HoshiTextField!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var userPicture: UIImageView!
    @IBOutlet weak var divorcedChecBox: BEMCheckBox!
    @IBOutlet weak var complicatedChecBox: BEMCheckBox!
    @IBOutlet weak var neverMarriedChecBox: BEMCheckBox!
    @IBOutlet weak var widowerChecBox: BEMCheckBox!
    //MARK: ACTIONS
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        self.viewContainer.bringSubview(toFront: views[sender.selectedSegmentIndex])
    }
    
    @IBAction func uploadPicture(_ sender: UIButton) {
        //Select Photo
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = .photoLibrary
        self.present(image,animated: true)
        
        
        //Upload Photo
        
    }
    
    @IBAction func validInfoButton(_ sender: GradientButton) {
        print("tin")
        
    }
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        //XIB
        switchView()
        //PHOTO SHAPE
        hexagonalImage()
        //Status
//        status = [divorcedChecBox,complicatedChecBox,neverMarriedChecBox,widowerChecBox]
        
        API.photos(){ (error: Error?, photos: [Photo]?) in
            if let photos = photos {
                self.photos = photos
                            }
        }
        
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
    
//    func didTap(_ checkBox: BEMCheckBox) {
//        // 1
//        let currentTag = checkBox.tag
//        // 2
//        guard let status = status else { return }
//        // 3
//        for box in status where box.tag != currentTag {
//            
//            // 4
//            box.on = false
//        }
//    }
}

extension PorfileViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            userPicture.image = editImage
            self.picker_image = editImage
            
        } else if let originaleImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userPicture.image = originaleImage
            self.picker_image = originaleImage
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
