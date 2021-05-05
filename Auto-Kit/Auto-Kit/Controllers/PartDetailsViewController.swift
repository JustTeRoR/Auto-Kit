//
//  PartDetailsViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 03.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit
import Alamofire

class PartDetailsViewController: UIViewController {
    
    open class MyServerTrustPolicyManager: ServerTrustPolicyManager {
        open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
            return ServerTrustPolicy.disableEvaluation
        }
    }

    let sessionManager = SessionManager(delegate:SessionDelegate(), serverTrustPolicyManager:MyServerTrustPolicyManager(policies: [:]))

    // MARK: - IBOutlets
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var serialNumber: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var measure: UILabel!
    @IBOutlet weak var make: UILabel!
    @IBOutlet weak var partType: UILabel!
    @IBOutlet weak var isOem: UILabel!
    @IBOutlet weak var lastPrice: UILabel!
    @IBOutlet weak var lastDeliverTime: UILabel!
    @IBOutlet weak var replacementTableView: UITableView!
    var replacePartList = [Part]()
    public var partModel: Part!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        replacementTableView.dataSource = self
        replacementTableView.delegate = self
        replacementTableView.register(UINib(nibName: "PartTableViewCell", bundle: nil),forCellReuseIdentifier: "partCell")
        replacementTableView.delegate = self
        self.loadBackground()
        replacementTableView.backgroundColor = UIColor.clear
        detailsPartInit(serialNumber: partModel.serialNumber, category: partModel.partTypeName, make: partModel.makeName, isOEM: partModel.isOEM, quantity: partModel.quantity, lastDeliveryDate: partModel.lastDeliveryTime, lastPricePurchase: partModel.lastPurchasePrice, measure: partModel.measureName)
        loadReplacementPartsById(part_id1: partModel.id)
    }

    @IBAction func addToCartButtonPush(_ sender: Any) {
        
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
    
    // MARK: - function for loading parts by serial number
    func loadReplacementPartsById(part_id1: Int16)
    {
        let service = PartsService(SessionManager: self.sessionManager)
        service.allReplacementPartsByPartId(part_id1: part_id1, userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!, completion: { [weak self] (parts) in
            self?.replacePartList = parts
            print("parts for replacement count \(self!.replacePartList.count)" )
            self?.replacementTableView.reloadData()
        })
    }
}
