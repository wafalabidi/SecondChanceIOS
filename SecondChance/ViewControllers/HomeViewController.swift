//
//  HomeViewController.swift
//  SecondChance
//
//  Created by macbook on 14/03/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import Koloda

private var numberOfCards: Int = 5

class HomeViewController: UIViewController {
    @IBOutlet weak var kolodaView: KolodaView!
    
    var users = [User]()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kolodaView.dataSource = self
        kolodaView.delegate = self
        API.getUserFilter(id: 1) { (error: Error?, users: [User]?) in
            if let users = users {
                self.users = users
                self.kolodaView.reloadData()
            }
        }
    }
    
    
    // MARK: IBActions
    
    @IBAction func leftButtonTapped() {
        kolodaView?.swipe(.left)
    }
    
    @IBAction func rightButtonTapped() {
        kolodaView?.swipe(.right)
    }
    
    @IBAction func undoButtonTapped() {
        kolodaView?.revertAction()
    }
}

// MARK: KolodaViewDelegate

extension HomeViewController: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
    
    }
}

// MARK: KolodaViewDataSource

extension HomeViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return users.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let imageview = UIImageView()
        var array: [UIImage] = []
        for index in 0..<numberOfCards {
            array.append(UIImage(named: "cards_\(index + 1)")!)
        }
//        reimageview.imageFromURL()
        return UIImageView(image: array[Int(index%numberOfCards)])
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}

