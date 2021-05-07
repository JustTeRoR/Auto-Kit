//
//  OrdersViewController+tableVIew.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 07.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import UIKit

extension OrdersViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell") as! OrdersTableViewCell
        let model = orderList[indexPath.row]
        
        cell.callback = { (val) in
           /* self.service.updateCountInShoppingList(orderPartId: model.id, count: Int8(val), userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!) {}*/
        }
        cell.commonInit(order: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}
