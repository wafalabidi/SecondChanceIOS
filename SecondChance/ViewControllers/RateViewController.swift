//
//  RateViewController.swift
//  SecondChance
//
//  Created by macbook on 17/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
    
    
    //MARK:Propreties
    
    
    //MARK:OUTLETS
    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var dislike: UIImageView!
    
    //MARK:ACTIONS
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        card.center = CGPoint(x: view.center.x + point.x, y:view.center.y + point.y)
        
        
        //SWIPE DIRECTION
        if xFromCenter > 0 {
            dislike.image = #imageLiteral(resourceName: "favorite-heart-button")
            dislike.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        } else {
            dislike.image = #imageLiteral(resourceName: "dislike")
            dislike.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        
        dislike.alpha = abs(xFromCenter) / view.center.x
        
        //SWIPE
        if sender.state == UIGestureRecognizerState.ended {
            //GET OUT OF SCREEN
            
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x : card.center.x - 200, y : card.center.y + 75)
                    card.alpha = 0
                })
                return
                
            } else if card.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x : card.center.x + 200, y : card.center.y + 75)
                    card.alpha = 0
                })
                return
                
                
            }
            
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.view.center
                self.dislike.alpha = 0
                
            }
            )}
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}
