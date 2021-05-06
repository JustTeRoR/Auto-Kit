//
//  ShoppingCartViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 05.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ShoppingCartViewController: UIViewController {
    
    open class MyServerTrustPolicyManager: ServerTrustPolicyManager {
        open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
            return ServerTrustPolicy.disableEvaluation
        }
    }
    let sessionManager = SessionManager(delegate:SessionDelegate(), serverTrustPolicyManager:MyServerTrustPolicyManager(policies: [:]))
    var service: OrderPartService!
    
    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var deleteSelectedButton: UIButton!
    @IBOutlet weak var deleteAllButton: UIButton!
    @IBOutlet weak var shoppingCartItemsCountLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var shoppingCartItemsTable: UITableView!
    @IBOutlet weak var finalSumPrefix: UILabel!
    var orderPartList = [OrderPart]()
    var selectedRows:[IndexPath] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiDesignInit()
        shoppingCartItemsTable.allowsSelection = false
        shoppingCartItemsTable.dataSource = self
        shoppingCartItemsTable.delegate = self
        shoppingCartItemsTable.register(UINib(nibName: "ShoppingCartTableViewCell", bundle: nil),forCellReuseIdentifier: "shopCartCell")
        shoppingCartItemsTable.delegate = self
        loadOrderPartsById()
    }
    
    @IBAction func deleteAllItems(_ sender: Any) {
    }
    
    @IBAction func deleteSelectedItems(_ sender: Any) {
    }
    
    @IBAction func placeOrderButtonTapped(_ sender: Any) {
    }
    
    func uiDesignInit() {
        placeOrderButton.layer.borderWidth = 3
        placeOrderButton.layer.borderColor = UIColor.black.cgColor
        finalSumPrefix.layer.borderWidth = 3
        finalSumPrefix.layer.borderColor = UIColor.black.cgColor
        finalSumPrefix.text = "Всего с вас: 0 руб."
        shoppingCartItemsCountLabel.text = "                                                          Товаров в вашей корзине: 0"
    }
    
    // MARK: - function for loading shopping cart items by User Id
    func loadOrderPartsById()
    {
        self.service = OrderPartService(SessionManager: self.sessionManager)
        service.getAllOrderPartsByUserId(userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!, completion: { [weak self] (orderParts) in
            self?.orderPartList = orderParts
            self?.shoppingCartItemsCountLabel.text = "                                                          Товаров в вашей корзине: \(self!.orderPartList.count)"
            let prices = orderParts.map { $0.price }
            let finalPrice = prices.reduce(0, +)
            self?.finalSumPrefix.text = "Всего с вас: \(finalPrice) руб."
            print("order parts in shopping cart count \(self!.orderPartList.count)" )
            self?.shoppingCartItemsTable.reloadData()
        })
    }
}
