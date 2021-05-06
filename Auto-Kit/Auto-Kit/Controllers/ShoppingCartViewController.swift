//
//  ShoppingCartViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 05.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import UIKit

class ShoppingCartViewController: UIViewController {
    
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
        shoppingCartItemsTable.dataSource = self
        shoppingCartItemsTable.delegate = self
        shoppingCartItemsTable.register(UINib(nibName: "ShoppingCartTableViewCell", bundle: nil),forCellReuseIdentifier: "shopCartCell")
        shoppingCartItemsTable.delegate = self
        
        
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
        shoppingCartItemsCountLabel.text = "                                                          В вашей корзине 0 товаров"
    }
}
