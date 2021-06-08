//
//  PartInOrderTableViewCell.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 07.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class PartInOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var serialNumber: UILabel!
    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var orderPartStatus: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func commonInit(orderPart: OrderPart?) {
        self.serialNumber.text = orderPart?.serialNumber
        self.count.text = String(orderPart?.count ?? 0)
        self.orderPartStatus.text = orderPart?.orderPartStatusTitle
        self.backgroundColor = .clear
        
        switch orderPartStatus.text {
        case "Снят клиентом":
            self.orderPartStatus.textColor = UIColor.red
        case "Заказан":
            self.orderPartStatus.textColor = UIColor.systemYellow
        case "Получен в пункт выдачи":
            self.orderPartStatus.textColor = UIColor.green
        default:
            self.orderPartStatus.textColor = UIColor.black
        }
    }
}
