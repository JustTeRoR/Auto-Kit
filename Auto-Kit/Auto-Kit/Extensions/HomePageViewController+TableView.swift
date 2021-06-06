//
//  HomePageViewController+TableViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 31.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import SwiftUI
import Alamofire

// MARK: - Extension for tableView
extension HomePageViewController: UITableViewDataSource, UITableViewDelegate  {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autoList.count
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAutoDetails = AutomobileDetailsViewController()
        selectedAutoDetails.autoModel = autoList[indexPath.row]
        navigationController?.pushViewController(selectedAutoDetails, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell", for: indexPath) as! CarTableViewCell
        let model = autoList[indexPath.row]
        
        cell.callback = { () in
            self.removeAutoByVin(vin: model.vin, index: indexPath.row)
        }
        cell.commonInit(make: model.make, model: model.model, engine: model.engine, style: model.style, vin: model.vin, year: model.year)
        return cell
    }
}
