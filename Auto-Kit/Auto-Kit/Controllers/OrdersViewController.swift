//
//  OrdersViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 07.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class OrdersViewController: UIViewController {
    let sessionManager = SessionManager(delegate:SessionDelegate(), serverTrustPolicyManager:MyServerTrustPolicyManager(policies: [:]))
    var service: OrderService!
    
    @IBOutlet weak var ordersCountLabel: UILabel!
    @IBOutlet weak var ordersTable: UITableView!
    var orderList = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiDesignInit()
        ordersTable.allowsSelection = false
        ordersTable.dataSource = self
        ordersTable.delegate = self
        ordersTable.register(UINib(nibName: "OrdersTableViewCell", bundle: nil),forCellReuseIdentifier: "orderCell")
        ordersTable.delegate = self
        loadOrdersByUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadOrdersByUser()
        DispatchQueue.main.async{
            self.ordersTable.reloadData()
        }
    }
    
    func uiDesignInit() {
        ordersCountLabel.text = "                                                          Количество ваших заказов: 0"
    }
    
    func loadOrdersByUser()
    {
        self.service = OrderService(SessionManager: self.sessionManager)
        service.getAllOrdersByUserId(userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!, completion: { [weak self] (orders) in
            self?.orderList = orders
            self?.ordersCountLabel.text = "                                                          Количество ваших заказов: \(self!.orderList.count)"
            self?.ordersTable.reloadData()
        })
    }
}
