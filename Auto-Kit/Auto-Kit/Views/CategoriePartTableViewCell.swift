//
//  CategoriePartTableViewCell.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 05.06.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class CategoriePartTableViewCell: UITableViewCell {

    var categoryPartModel: CategoriePart!
   
    @IBOutlet weak var serialNumber_lbl: UILabel!
    @IBOutlet weak var categoryPartName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(categoryPartModel: CategoriePart) {
        self.categoryPartModel = categoryPartModel
        self.categoryPartName.text = categoryPartModel.partName
        self.serialNumber_lbl.text = categoryPartModel.serialNumber
        self.backgroundColor = .none
    }
}
