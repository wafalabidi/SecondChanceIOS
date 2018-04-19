//
//  MatchTableViewCell.swift
//  SecondChance
//
//  Created by Admin on 4/8/18.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var nbrUnseenMessagesLabel: UILabel!
    
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    var id : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
