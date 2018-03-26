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
class LoginViewController: UIViewController {
    //MARK:Prepreties
    private let backGroundArray = [ #imageLiteral(resourceName: "couple1"), #imageLiteral(resourceName: "Happy-Couple-app-579e5e9f3df78c32768a8cce-2"), #imageLiteral(resourceName: "couple")]
    private var idx: Int = 0
   
    //MARK : Outlets
    @IBOutlet weak var logButton: TransitionButton!
    @IBOutlet weak var imageView: UIImageView!
    
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
        
        // Visual Effect View for background
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.dark)) as UIVisualEffectView
        visualEffectView.frame = self.view.frame
        visualEffectView.alpha = 0.5
        imageView.image = #imageLiteral(resourceName: "Happy-Couple-app-579e5e9f3df78c32768a8cce-2")
        imageView.addSubview(visualEffectView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
    }
    
    //MARK: Public Functions
    @objc func changeImage(){
        idx = (idx+1) % backGroundArray.count
        let toImage = backGroundArray[idx]
        UIView.transition(with: self.imageView, duration: 0.01, options: .transitionCrossDissolve, animations: {self.imageView.image = toImage}, completion: nil)
    }


}
