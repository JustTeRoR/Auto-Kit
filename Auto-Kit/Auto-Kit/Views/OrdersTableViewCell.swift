//
//  OrdersTableViewCell.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 07.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var removeOrderButton: UIButton!
    @IBOutlet weak var OrderName: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    @IBOutlet weak var changeDate: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var serialNumberAndCountsLabel: UILabel!
    var representingObject: Order!
    
    // "callback" closure - set my controller in cellForRowAt
    var callback: ((Int) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    @IBAction func removeOrderButtonClicked(_ sender: Any) {
        
    }
    
    func commonInit(order: Order)
    {
        representingObject = order
        
    }
}
