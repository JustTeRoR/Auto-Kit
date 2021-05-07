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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
