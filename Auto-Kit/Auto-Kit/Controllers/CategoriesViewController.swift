//
//  СategoriesViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 04.06.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit
import Alamofire

class CategoriesViewController: UIViewController {
    
    let sessionManager = SessionManager(delegate:SessionDelegate(), serverTrustPolicyManager:MyServerTrustPolicyManager(policies: [:]))
    var service: CategorieService!
    var autoModel: Automobile!
    var categorieList = [Categorie]()
 
    
    @IBOutlet weak var categoriesTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBackground()
        self.service = CategorieService(SessionManager: self.sessionManager)
        loadCategories()
        categoriesTable.dataSource = self
        categoriesTable.delegate = self
        categoriesTable.register(UINib(nibName: "CategorieTableViewCell", bundle: nil),forCellReuseIdentifier: "categoryCell")
        categoriesTable.delegate = self
        
    }

   
    func loadCategories() {
        service.getAllCategories(userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!, completion: { [weak self] (categories) in
            self?.categorieList = categories
            self?.categoriesTable.reloadData();
        })
    }
}
