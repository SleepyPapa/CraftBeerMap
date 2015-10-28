//
//  BasicCell.swift
//  CraftBeerMap
//
//  Created by Daddy on 2015-10-27.
//  Copyright © 2015 Gregory Lavery. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {
    

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
