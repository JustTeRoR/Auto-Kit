//
//  PartsByCategoryViewController+TableView.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 05.06.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import Alamofire

extension PartsByCategoryViewController: UITableViewDataSource, UITableViewDelegate  {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriePartList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPartDetails = PartDetailsViewController()
        let partSerialNumber = categoriePartList[indexPath.row].serialNumber
        let servicePart = PartsService(SessionManager: sessionManager)

        DispatchQueue.global().async (execute: {
            DispatchQueue.main.sync {
                servicePart.allPartsBySerialNumber(query: partSerialNumber, userId: String(AppDelegate.shared().authService.userId!), access_token: AppDelegate.shared().authService.token!, completion: { [weak self] (parts) in
                    self?.partModelBySerial = parts
                    selectedPartDetails.partModel = self?.partModelBySerial[0]
                    print("finished loading part model")
                    self?.navigationController?.pushViewController(selectedPartDetails, animated: true)
                })
            }
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryPartCell", for: indexPath) as! CategoriePartTableViewCell
        let model = categoriePartList[indexPath.row]
        cell.commonInit(categoryPartModel:model)
        return cell
    }
}
