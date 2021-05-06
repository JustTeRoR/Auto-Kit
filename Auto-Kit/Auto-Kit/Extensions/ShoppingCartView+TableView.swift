//
//  ShoppingCartView+TableView.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 06.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import UIKit
extension ShoppingCartViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderPartList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopCartCell") as! ShoppingCartTableViewCell
        if selectedRows.contains(indexPath)
        {
            cell.checkBoxButton.setImage(UIImage(named:"selected"), for: .normal)
        }
        else
        {
          cell.checkBoxButton.setImage(UIImage(named:"unselected"), for: .normal)
        }
        cell.checkBoxButton.tag = indexPath.row
        cell.checkBoxButton.addTarget(self, action: #selector(checkBoxSelection(_:)), for: .touchUpInside)
        return cell
    }
    @objc func checkBoxSelection(_ sender:UIButton)
    {
        let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
        if self.selectedRows.contains(selectedIndexPath)
        {
            self.selectedRows.remove(at: self.selectedRows.firstIndex(of: selectedIndexPath)!)
        }
        else
        {
          self.selectedRows.append(selectedIndexPath)
        }
        self.shoppingCartItemsTable.reloadData()
    }
}
