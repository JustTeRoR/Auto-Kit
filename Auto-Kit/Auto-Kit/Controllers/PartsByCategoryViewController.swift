//
//  PartsByCategoryViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 04.06.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit
import Alamofire

class PartsByCategoryViewController: UIViewController {
    
    let sessionManager = SessionManager(delegate:SessionDelegate(), serverTrustPolicyManager:MyServerTrustPolicyManager(policies: [:]))
    var service: CategorieService!
    var automobileService: AutomobileService!
    var autoModel: Automobile!
    var categoryModel: Categorie!
    var vinModel: Vin!
    var categoriePartList = [CategoriePart]()
    var partModelBySerial = [Part]()
    @IBOutlet weak var categoryPartsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadBackground()
        
        categoryPartsTable.dataSource = self
        categoryPartsTable.delegate = self
        categoryPartsTable.register(UINib(nibName: "CategoriePartTableViewCell", bundle: nil),forCellReuseIdentifier: "categoryPartCell")
        categoryPartsTable.delegate = self
        categoryPartsTable.backgroundColor = .none
        //loadVinEntity()
        loadPartsByCategory()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    func loadVinEntity() {
        let automobileService = AutomobileService(SessionManager: self.sessionManager)
        automobileService.parseVinNumberToVinEntity(vin: autoModel.vin, userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!, completion: { [weak self] (vin) in
            self?.vinModel = vin
        })
    }
    
    func loadPartsByCategory()
    {
        let service = CategoriePartService(SessionManager: self.sessionManager)
        //vinModel.modelYearID
        service.getAllPartsByCategorie(categorieId: categoryModel.id, modelAutomobileId: 7,  userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!, completion: { [weak self] (parts) in
            self?.categoriePartList = parts
            self?.categoryPartsTable.reloadData()
        })
    }
}
