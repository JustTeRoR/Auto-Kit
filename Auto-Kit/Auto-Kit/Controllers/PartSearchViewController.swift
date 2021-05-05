//
//  File.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 02.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit
import Alamofire

class PartSearchViewController: UIViewController {
    
    open class MyServerTrustPolicyManager: ServerTrustPolicyManager {
        open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
            return ServerTrustPolicy.disableEvaluation
        }
    }

    let sessionManager = SessionManager(delegate:SessionDelegate(), serverTrustPolicyManager:MyServerTrustPolicyManager(policies: [:]))
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var partsTableView: UITableView!
    @IBOutlet weak var partsSearchBar: UISearchBar!
    var partList = [Part]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        partsTableView.dataSource = self
        partsTableView.delegate = self
        partsTableView.register(UINib(nibName: "PartTableViewCell", bundle: nil),forCellReuseIdentifier: "partCell")
        partsSearchBar.delegate = self
        
        self.loadBackground()
        partsTableView.backgroundColor = UIColor.clear
    }
    // MARK: - function for loading parts by serial number
    func loadPartsByCurrentQuery(query: String)
    {
        let service = PartsService(SessionManager: self.sessionManager)
        service.allPartsBySerialNumber(query: query, userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!, completion: { [weak self] (parts) in
            self?.partList = parts
            print("parts count \(self!.partList.count)" )
            self?.partsTableView.reloadData()
        })
    }
}
