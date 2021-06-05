//
//  СategoriesViewController+TableView.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 04.06.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import SwiftUI
import Alamofire

// MARK: - Extension for tableView
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate  {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorieList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPartCategorieParts = PartsByCategoryViewController()
        selectedPartCategorieParts.categoryModel = categorieList[indexPath.row]
        selectedPartCategorieParts.autoModel = self.autoModel
        navigationController?.pushViewController(selectedPartCategorieParts, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategorieTableViewCell
        let model = categorieList[indexPath.row]
        cell.commonInit(categoryModel: model)
        return cell
    }
}
