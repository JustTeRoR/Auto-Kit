//
//  PartSearchViewController+tableView.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 02.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import SwiftUI
import Alamofire

// MARK: - Extension for tableView
extension PartSearchViewController: UITableViewDataSource, UITableViewDelegate  {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partList.count
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPartDetails = PartDetailsViewController()
        selectedPartDetails.partModel = partList[indexPath.row]
        navigationController?.pushViewController(selectedPartDetails, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partCell", for: indexPath) as! PartTableViewCell
        let model = partList[indexPath.row]
        cell.commonInit(serialNumber: model.serialNumber, category: model.partTypeName, make: model.makeName, isOEM: model.isOEM, quantity: model.quantity)
        return cell
    }
}

extension PartSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        loadPartsByCurrentQuery(query: searchBar.text ?? "")
    }
}
