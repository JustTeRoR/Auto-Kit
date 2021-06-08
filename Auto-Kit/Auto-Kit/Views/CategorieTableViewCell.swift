//
//  CategorieTableViewCell.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 04.06.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class CategorieTableViewCell: UITableViewCell {

    var categoryModel: Categorie!
    @IBOutlet weak var categoryName_lbl: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(categoryModel: Categorie) {
        self.categoryModel = categoryModel
        self.categoryName_lbl.text = categoryModel.name
    }
    
}
