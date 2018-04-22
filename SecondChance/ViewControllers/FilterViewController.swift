//
//  FilterViewController.swift
//  SecondChance
//
//  Created by macbook on 15/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import RangeSeekSlider
import DLRadioButton
class FilterViewController: UIViewController,BEMCheckBoxDelegate{
    
    //MARK:PROPRETIES
    var sliderMaxValue = 0
    var sliderMinValue = 0
    var allStatus = [String]()
    var relations = [String]()
    var haveChildren = false
    var genderSelected = ""
    var b : Filters?
    
    //MARK: OUTLETS
    
    @IBOutlet weak var processDivorceCheckBox: BEMCheckBox!
    @IBOutlet weak var divorcedCheckBox: BEMCheckBox!
    @IBOutlet weak var neverMariedCheckBox: BEMCheckBox!
    @IBOutlet weak var widowerCheckBox: BEMCheckBox!
    @IBOutlet weak var ageRangeVal: UILabel!
    @IBOutlet weak var ageValueMin: UILabel!
    @IBOutlet weak var gender: DLRadioButton!
    @IBOutlet weak var haveChild: DLRadioButton!
    @IBOutlet weak var ageRange: RangeSeekSlider!
    @IBOutlet weak var Affaire: BEMCheckBox!
    @IBOutlet weak var friendship: BEMCheckBox!
    @IBOutlet weak var engagement: BEMCheckBox!
    
    
    
    //MARK:ACTIONS
    
    @IBAction func sexeAction(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            genderSelected = (sender.titleLabel?.text)!
        } else if sender.tag == 2 {
            genderSelected = (sender.titleLabel?.text)!
            
        }
        print(genderSelected)
    }
    
    @IBAction func haveChildAction(_ sender: DLRadioButton) {
        if sender.tag == 3 {
            genderSelected = (sender.titleLabel?.text)!
        } else if sender.tag == 4{
            haveChildren = false
            
        }
        print(haveChild)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        
        API.editFilter(gender: "Woman", minAge: 20, maxAge: 20, country: "", town: "", hasChildre: true, statusList:
            allStatus, relationshipTypeList: relations, livesAlone: true)
        { (error:Error?,success:Bool ) in
            if(success){
                print("sahiti")
            }
            else {
                print(error!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hexagonalButton(button: processDivorceCheckBox)
        hexagonalButton(button: divorcedCheckBox)
        hexagonalButton(button: neverMariedCheckBox)
        hexagonalButton(button: widowerCheckBox)
        hexagonalButton(button: Affaire)
        hexagonalButton(button: friendship)
        hexagonalButton(button: engagement)
        
        //checkBox Delegate
        
        divorcedCheckBox.delegate = self
        neverMariedCheckBox.delegate = self
        widowerCheckBox.delegate = self
        processDivorceCheckBox.delegate = self
        Affaire.delegate = self
        friendship.delegate = self
        engagement.delegate = self
        
        //Slider
        ageRange.delegate = self
        
        API.getUSerInfo() { (f:Filters)  in
            self.ageRangeVal.text  = "\(f.ageMin)"
            self.ageValueMin.text = "\(f.ageMax)"
            
        }

        
    }

    
    
    func didTap(_ checkBox: BEMCheckBox) {
        
        
        if checkBox.tag == 0{
            addRemoveOption(forState: checkBox.on == true, option: "complicated")
        } else if checkBox.tag == 1{
            addRemoveOption(forState: checkBox.on == true, option: "Divorced")
        } else if checkBox.tag == 2{
            addRemoveOption(forState: checkBox.on == true, option: "Never Married")
        } else if checkBox.tag == 3{
            addRemoveOption(forState: checkBox.on == true, option: "Widower")
            
        }else if checkBox.tag == 4{
            addRemoveRelationNature(forState: checkBox.on, relation: "Affaire")
            
        }else if checkBox.tag == 5{
            addRemoveRelationNature(forState: checkBox.on, relation: "Friendship")
            
        }else if checkBox.tag == 6{
            addRemoveRelationNature(forState: checkBox.on, relation: "Engagement")
            
        }
        print(allStatus)
        print(haveChildren)
        print(genderSelected)
        print(relations)
        
        
        
    }
    
    
    
    
    func addRemoveOption(forState : Bool , option : String){
        switch forState{
        case true:
            allStatus += [option]
        case false:
            if let index = allStatus.index(of: option)
            {
                allStatus.remove(at: index)
            }
            
        }
        
    }
    
    func addRemoveRelationNature(forState : Bool , relation : String){
        switch forState{
        case true:
            relations += [relation]
        case false:
            if let index = relations.index(of: relation)
            {
                relations.remove(at: index)
            }
            
        }
        
    }
    
 
    
}

extension FilterViewController: RangeSeekSliderDelegate {
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        if slider === ageRange {
            
            let x = CGFloat(minValue)
            let s = String(format: "%.0f", Double(x))
            ageRangeVal.text = s
            sliderMinValue = Int(s)!
            print(sliderMinValue)
            let xx = CGFloat(maxValue)
            let ss = String(format: "%.0f", Double(xx))
            ageRangeVal.text = ss
            sliderMaxValue = Int(ss)!
            print(sliderMaxValue)
            
        }
    }
    
   
}
