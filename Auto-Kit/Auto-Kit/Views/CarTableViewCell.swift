//
//  CarTableViewCell.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 31.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet weak var make_model_lbl: UILabel!
    @IBOutlet weak var engine_lbl: UILabel!
    @IBOutlet weak var styleLbl: UILabel!
    @IBOutlet weak var vin_lbl: UILabel!
    @IBOutlet weak var year_lbl: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // "callback" closure - set my controller in cellForRowAt
    var callback: (() -> ())?
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        print("car selected for delete")
        callback?()
    }
    
    func commonInit(make: String, model: String, engine: String, style: String, vin: String, year: String)
    {
        self.make_model_lbl.text = "\(make)  \(model)"
        self.engine_lbl.text = engine
        self.styleLbl.text = style
        self.vin_lbl.text = vin
        self.year_lbl.text = year
        deleteButton.layer.cornerRadius = 5
    }
}
