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
    var representingObject: OrderPart!
    
    // "callback" closure - set my controller in cellForRowAt
    var callback: ((Int) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func commonInit(orderPart: OrderPart)
    {
        representingObject = orderPart
        stepperForCount.minimumValue = 1
        stepperForCount.value = Double(orderPart.count)
        self.serialNumber.text = orderPart.serialNumber
        self.count.text = String(orderPart.count)
        self.provider.text = orderPart.partProviderName
        self.orderPartStatus.text = orderPart.orderPartStatusTitle
        let purchasePriceString = "\(orderPart.purchasePrice)"
        self.purchasePrice.text = purchasePriceString
        let labourPriceString = "\(orderPart.labourPrice)"
        self.labourPrice.text = labourPriceString
    }
    
    @IBAction func utStepperValueChanged(_ sender: UIStepper!) {
        self.count.text = String(Int(sender.value))
        callback?(Int(sender.value))
    }
}
