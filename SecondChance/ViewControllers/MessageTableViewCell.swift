//
//  MessageTableViewCell.swift
//  SecondChance
//
//  Created by macbook on 02/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var lastMessage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
