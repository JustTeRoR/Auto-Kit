//
//  OrdersTableViewCell.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 07.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var removeOrderButton: UIButton!
    @IBOutlet weak var OrderName: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    @IBOutlet weak var changeDate: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var orderPartInTable: UITableView!
    var representingObject: Order!
    var orderPartsOfOrder: [OrderPart]?
    
    // "callback" closure - set my controller in cellForRowAt
    var callback: ((Int) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    @IBAction func removeOrderButtonClicked(_ sender: Any) {
        callback?(Int(representingObject.id))
        self.removeOrderButton.isHidden = true
    }
    
    func commonInit(order: Order)
    {
        representingObject = order
        if (representingObject.statusKey == "Cancelled by user" || representingObject.statusKey == "Ready to collect") {
            self.removeOrderButton.isHidden = true
        } else {
            self.removeOrderButton.isHidden = false
        }
        
        self.OrderName.text = "Заказ #\(representingObject.id)"
        self.creationDate.text = representingObject.creationDate
        self.changeDate.text = representingObject.changeDate
        self.userName.text = representingObject.userName
        let priceStr = "\(representingObject.price)"
        self.price.text = priceStr
        self.orderStatus.text = representingObject.statusName
        
        switch orderStatus.text {
        case "Отменен пользователем":
            self.orderStatus.textColor = UIColor.red
            
        case "Заказан пользователем":
            self.orderStatus.textColor = UIColor.systemYellow
        case "Доставлен в пункт выдачи":
            self.orderStatus.textColor = UIColor.green
        default:
            self.orderStatus.textColor = UIColor.black
        }
        
        orderPartInTable.allowsSelection = false
        orderPartInTable.register(UINib(nibName: "PartInOrderTableViewCell", bundle: nil),forCellReuseIdentifier: "partInOrderCell")
        orderPartInTable.backgroundColor = .clear
        orderPartInTable.dataSource = self
        orderPartInTable.delegate = self
        orderPartInTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderPartsOfOrder?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partInOrderCell") as! PartInOrderTableViewCell
        let model = orderPartsOfOrder?[indexPath.row]
        cell.commonInit(orderPart: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
}
