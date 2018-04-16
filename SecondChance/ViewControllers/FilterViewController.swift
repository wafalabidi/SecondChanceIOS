//
//  FilterViewController.swift
//  SecondChance
//
//  Created by macbook on 15/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import BEMCheckBox
import AORangeSlider

class FilterViewController: UIViewController {
    
    //MARK:PROPRETIES
    var sliderMaxValue = 0
    var sliderMinValue = 0
    
    //MARK: OUTLETS
    @IBOutlet weak var manCheckBox: BEMCheckBox!
    @IBOutlet weak var womenCheckBox: BEMCheckBox!
    @IBOutlet weak var processDivorceCheckBox: BEMCheckBox!
    @IBOutlet weak var divorcedCheckBox: BEMCheckBox!
    @IBOutlet weak var neverMariedCheckBox: BEMCheckBox!
    @IBOutlet weak var widowerCheckBox: BEMCheckBox!
    @IBOutlet weak var yesCheckBox: BEMCheckBox!
    @IBOutlet weak var noCheckBox: BEMCheckBox!
    @IBOutlet weak var ageRange: AORangeSlider!
    @IBOutlet weak var ageRangeVal: UILabel!
    //MARK:ACTIONS
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hexagonalButton(hello: manCheckBox)
        hexagonalButton(hello: womenCheckBox)
        hexagonalButton(hello: processDivorceCheckBox)
        hexagonalButton(hello: divorcedCheckBox)
        hexagonalButton(hello: neverMariedCheckBox)
        hexagonalButton(hello: widowerCheckBox)
        hexagonalButton(hello: yesCheckBox)
        hexagonalButton(hello: noCheckBox)
        setupIndicatorSlider()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setupIndicatorSlider() {
        
        
        ageRange.minimumValue = 19
        ageRange.maximumValue = 80
        ageRange.lowValue = 18
        ageRange.highValue = 80
        
        
        
        ageRange.valuesChangedHandler = { [weak self] in
            guard let `self` = self else {
                return
            }
            
            
            self.ageRangeVal.text = String(Int( self.ageRange.lowValue))
            //            highLabel.text = String(format: "%.1f", self.indicatorSlider.highValue)
        }
        
    }
}
