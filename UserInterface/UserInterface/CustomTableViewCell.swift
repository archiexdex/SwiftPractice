//
//  CustomTableViewCell.swift
//  UserInterface
//
//  Created by 楊信之 on 9/28/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var theSlider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
