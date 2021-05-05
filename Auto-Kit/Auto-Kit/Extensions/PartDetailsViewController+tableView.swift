//
//  PartDetailsViewController+tableView.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 05.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Extension for tableView
extension PartDetailsViewController: UITableViewDataSource, UITableViewDelegate  {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return replacePartList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPartDetails = PartDetailsViewController()
        selectedPartDetails.partModel = replacePartList[indexPath.row]
        navigationController?.pushViewController(selectedPartDetails, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partCell", for: indexPath) as! PartTableViewCell
        let model = replacePartList[indexPath.row]
        cell.commonInit(serialNumber: model.serialNumber, category: model.partTypeName, make: model.makeName, isOEM: model.isOEM, quantity: model.quantity)
        return cell
    }
    
    func detailsPartInit(serialNumber: String, category: String, make: String, isOEM: Bool, quantity: Int8, lastDeliveryDate: String, lastPricePurchase: Decimal, measure: String ) {
        self.serialNumber.text = serialNumber;
        self.partType.text = category
        self.make.text = make;
        if isOEM {
            self.isOem.text = "Оригинал"
        } else {
            self.isOem.text = "Аналог"
        }
        self.quantity.text = String(quantity)
        self.lastDeliverTime.text = lastDeliveryDate
        let decimalString = "\(lastPricePurchase)"
        self.lastPrice.text = decimalString
        self.measure.text = measure
    }
}
