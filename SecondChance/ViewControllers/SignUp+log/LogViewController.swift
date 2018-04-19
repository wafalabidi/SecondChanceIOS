//
//  LogViewController.swift
//  SecondChance
//
//  Created by macbook on 17/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import TextFieldEffects
import TransitionButton
import RAMAnimatedTabBarController

class LogViewController: UIViewController {
    
    //MARK:Propreties
    
    
    //MARK:OUTLETS
    
    @IBOutlet weak var emailTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    @IBOutlet weak var signin: TransitionButton!
    
    //MARK:ACTIONS
    
    @IBAction func signinButton(_ sender: TransitionButton) {
        
        self.signin.startAnimation()
        
        guard let email = emailTextField.text, !email.isEmpty else {return }
        guard let password = passwordTextField.text, !password.isEmpty else {return }
        API.login(email: email, password: password) { (error: Error?, success: Bool) in
            
            if success {
                let qualityOfServiceClass = DispatchQoS.QoSClass.background
                let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
                backgroundQueue.async(execute: {
                    
                    sleep(3)
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                        self.signin.stopAnimation(animationStyle: .expand, completion: {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            if let controller = storyboard.instantiateViewController(withIdentifier: "RAMAnimatedTabBarController")  as? RAMAnimatedTabBarController {
                                self.present(controller, animated: true, completion: nil)
                            }
                        })
                    })
                })            } else
            {
                self.signin.stopAnimation()
            }
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }


  
}
