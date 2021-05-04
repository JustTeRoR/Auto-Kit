//
//  PartTableViewCell.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 02.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class PartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var serialNumber_lbl: UILabel!
    @IBOutlet weak var category_lbl: UILabel!
    @IBOutlet weak var make_lbl: UILabel!
    @IBOutlet weak var isOEM_lbl: UILabel!
    @IBOutlet weak var quantity_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //selectionStyle = .none
    }

    func commonInit(serialNumber: String, category: Int16, make: Int16, isOEM: Bool, quantity: Int8)
    {
        self.serialNumber_lbl.text = serialNumber
        self.category_lbl.text = String(category)
        self.make_lbl.text = String(make)
        
        if isOEM {
            self.isOEM_lbl.text = "Оригинал"
        } else {
            self.isOEM_lbl.text = "Аналог"
        }
        self.quantity_lbl.text = String(quantity)
    }
    
}
