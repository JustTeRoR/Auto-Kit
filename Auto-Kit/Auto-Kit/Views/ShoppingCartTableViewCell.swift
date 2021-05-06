//
//  ShoppingCartTableViewCell.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 06.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {

    @IBOutlet weak var serialNumber: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var provider: UILabel!
    @IBOutlet weak var orderPartStatus: UILabel!
    @IBOutlet weak var purchasePrice: UILabel!
    @IBOutlet weak var labourPrice: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var stepperForCount: UIStepper!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
