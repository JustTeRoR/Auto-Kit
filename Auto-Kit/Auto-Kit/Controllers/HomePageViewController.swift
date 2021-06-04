//
//  HomePageViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 31.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class HomePageViewController : UIViewController {
    let sessionManager = SessionManager(delegate:SessionDelegate(), serverTrustPolicyManager:MyServerTrustPolicyManager(policies: [:]))
    var service: AutomobileService!
    
    @IBOutlet weak var deliveryAddressLabel: UILabel!
    @IBOutlet weak var addVINButton: UIButton!
    @IBOutlet weak var inputTextVin: UITextField!
    @IBOutlet weak var carListLabel: UILabel!
    @IBOutlet weak var carListTable: UITableView!
    var autoList = [Automobile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = AutomobileService(SessionManager: self.sessionManager)
        uiDesignInit()
        carListTable.dataSource = self
        carListTable.delegate = self
        carListTable.register(UINib(nibName: "CarTableViewCell", bundle: nil),forCellReuseIdentifier: "carCell")
        carListTable.delegate = self
        loadAutomobiles()
    }
    
    func uiDesignInit() {
        addVINButton.layer.borderWidth = 1
        addVINButton.layer.borderColor = UIColor.orange.cgColor
        inputTextVin.layer.borderWidth = 1
        inputTextVin.layer.borderColor = UIColor.orange.cgColor
        deliveryAddressLabel.layer.borderWidth = 2
        deliveryAddressLabel.layer.borderColor = UIColor.orange.cgColor
        carListLabel.layer.borderWidth = 1
        carListLabel.layer.borderColor = UIColor.orange.cgColor
    }
    
    func loadAutomobiles() {
        service.parseAllUsersAutomobiles(userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!, completion: { [weak self] (automobiles) in
            self?.autoList = automobiles
            self?.carListTable.reloadData();
        })
    }
    
    @IBAction func addNewUserAuto(_ sender: Any) {
        service.parseVinNumberIntoCarDetails(vin: inputTextVin.text ?? "", userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!) { [weak self] (automobile) in
            self?.autoList.append(automobile)
            DispatchQueue.main.async{
                self?.carListTable.reloadData()
            }
        }
        inputTextVin.text?.removeAll()
        
    }
}
