//
//  LoginViewController.swift
//  SecondChance
//
//  Created by macbook on 13/03/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import TransitionButton
import RAMAnimatedTabBarController
import TextFieldEffects

class LoginViewController: UIViewController {
    //MARK:Prepreties
    private var idx: Int = 0
   
    //MARK : Outlets
    @IBOutlet weak var logButton: TransitionButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailLabel: HoshiTextField!
    
    //MARK: Actions
    
    @IBAction func loginButton(_ sender: TransitionButton) {
       self.logButton.startAnimation()
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(3)
            
            DispatchQueue.main.async(execute: { () -> Void in
                
                self.logButton.stopAnimation(animationStyle: .expand, completion: {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let controller = storyboard.instantiateViewController(withIdentifier: "RAMAnimatedTabBarController")  as? RAMAnimatedTabBarController {
                        self.present(controller, animated: true, completion: nil)
                    }
                })
            })
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.dark)) as UIVisualEffectView
        visualEffectView.frame = self.view.frame
        visualEffectView.alpha = 0.6
        imageView.startAnimating()
        imageView.addSubview(visualEffectView)
        
  
      
        
    }
    



}
