//
//  HighScoreCell.swift
//  snakeProject
//
//  Created by James Ahrens on 11/12/18.
//  Copyright © 2018 James Ahrens. All rights reserved.
//

import UIKit

class HighScoreCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
