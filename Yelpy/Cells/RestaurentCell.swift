//
//  RestaurentCell.swift
//  Yelpy
//
//  Created by Mohamed Omane on 9/25/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit

class RestaurentCell: UITableViewCell {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var labelTextField: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
