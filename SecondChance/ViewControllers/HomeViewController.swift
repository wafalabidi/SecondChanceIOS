//
//  HomeViewController.swift
//  SecondChance
//
//  Created by macbook on 14/03/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    //MARK: OUTLET
    
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var viewAction: UIView!
    @IBOutlet weak var viewActionHeightConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var superButton: LoveButton!
    @IBOutlet weak var likeButton: LoveButton!
    @IBOutlet weak var dislikeButton: LoveButton!
    //MARK: PROPRETIES
    
    let  MAX_BUFFER_SIZE = 3;
    let  SEPERATOR_DISTANCE = 8;
    let  TOPYAXIS = 75;
    
    
    var currentIndex = 0
    var isMakeUndo = false
    var currentLostCard : Card!
    var currentLoadedCardsArray = [Card]()
    var allCardsArray = [Card]()
    var valueArray = ["1","2","3","4","5","6","7","8","9"]
    var users = [User]()
    
    //MARK:Actions
    
    @IBAction func dislike(_ sender: LoveButton) {
        let card = currentLoadedCardsArray.first
        card?.leftClickAction()
        sender.isLoved = !sender.isLoved!

    }
    
    @IBAction func like(_ sender: LoveButton) {
        let card = currentLoadedCardsArray.first
        card?.rightClickAction()
        sender.isLoved = !sender.isLoved!

    }
    
    @IBAction func superlike(_ sender: LoveButton) {
        sender.isLoved = !sender.isLoved!

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCards()
        
        likeButton.isLoved = false
        dislikeButton.isLoved = false
        superButton.isLoved = false

        API.getUserFilter(id: 1) { (error: Error?, users: [User]?) in
            if let users = users {
                self.users = users
            }
        }
        print("heyyyyyyyyy\(users)")
    }

    func loadCards() {

        if valueArray.count > 0 {

            let num_currentLoadedCardsArrayCap = (valueArray.count > MAX_BUFFER_SIZE) ? MAX_BUFFER_SIZE : valueArray.count
            for (i,value) in valueArray.enumerated() {
                let newCard = createDraggableViewWithData(at: i,value: value)
                allCardsArray.append(newCard)
                if i < num_currentLoadedCardsArrayCap {
                    currentLoadedCardsArray.append(newCard)
                }
            }

            for (i,_) in currentLoadedCardsArray.enumerated() {
                if i > 0 {
                    swipeView.insertSubview(currentLoadedCardsArray[i], belowSubview: currentLoadedCardsArray[i - 1])
                }
                else {
                    swipeView.addSubview(currentLoadedCardsArray[i])
                }
                currentIndex += 1
            }
            animateCardAfterSwiping()
            self.perform(#selector(createDummyCard), with: nil, afterDelay: 1.0)
        }
    }
    
    @objc func createDummyCard() {
        
        let dummyCard = currentLoadedCardsArray.first;
        dummyCard?.shakeCard()
        UIView.animate(withDuration: 1.0, delay: 2.0, options: .curveLinear, animations: {
            self.viewAction.alpha = 1.0
        }, completion: nil)
    }
    
    func createDraggableViewWithData(at index: Int , value :String) -> Card {
        
        let card = Card(frame: CGRect(x: 10, y: 0, width: swipeView.frame.size.width - 20 , height: swipeView.frame.size.height - 40) ,value : value)
        card.delegate = self
        card.intex = index
        return card
    }
    func removeObjectAndAddNewValues() {
        
        currentLostCard = currentLoadedCardsArray.first!
        superButton.isHidden = true
        Timer.scheduledTimer(timeInterval: 1.01, target: self, selector: #selector(enableUndoButton), userInfo: currentLoadedCardsArray.first, repeats: false)
        currentLoadedCardsArray.remove(at: 0)
        if currentIndex < allCardsArray.count {
            let card = allCardsArray[currentIndex]
            var frame = card.frame
            frame.origin.y = CGFloat(MAX_BUFFER_SIZE * SEPERATOR_DISTANCE)
            card.frame = frame
            currentLoadedCardsArray.append(card)
            currentIndex += 1
            swipeView.insertSubview(currentLoadedCardsArray[MAX_BUFFER_SIZE - 1], belowSubview: currentLoadedCardsArray[MAX_BUFFER_SIZE - 2])
        }
        print(currentIndex)
        animateCardAfterSwiping()
    }
    func animateCardAfterSwiping() {
        
        for (i,card) in currentLoadedCardsArray.enumerated() {
            UIView.animate(withDuration: 0.5, animations: {
                if i == 0 {
                    card.isUserInteractionEnabled = true
                }
                var frame = card.frame
                frame.origin.y = CGFloat(i * self.SEPERATOR_DISTANCE)
                card.frame = frame
            })
        }
    }
    @objc func enableUndoButton(timer: Timer){
        
        let  lostCard = timer.userInfo as! Card
        if currentLostCard.intex == lostCard.intex{
            self.superButton.isHidden = false
            self.isMakeUndo = false
        }
    }
    
    

  
}

extension HomeViewController : CardDelegate{
    
    // action called when the card goes to the left.
    func cardSwipedLeft(_ card: Card) {
        removeObjectAndAddNewValues()
    }
    // action called when the card goes to the right.
    func cardSwipedRight(_ card: Card) {
        removeObjectAndAddNewValues()
    }
    func updateCardView(_ card: Card, withDistance distance: CGFloat) {
        //Log(@"%f",distance);
    }
}
