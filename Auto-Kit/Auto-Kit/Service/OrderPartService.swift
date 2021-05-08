//
//  OrderPartService.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 06.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import Alamofire

class OrderPartService {
    
    private let authService: AuthService
    private let sessionManager: SessionManager
    init(authService: AuthService = AppDelegate.shared().authService, SessionManager: SessionManager) {
        self.authService = authService
        self.sessionManager = SessionManager
    }
    
    func getAllOrderPartsByUserId(userId: String, access_token: String, completion: @escaping ([OrderPart])->Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.orderPartSection+"/by_user_ids?user_ids=\(userId)&access_token=\(access_token)"
        sessionManager.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let appropriateOrderPartList: [OrderPart] = try JSONDecoder().decode([OrderPart].self, from: data)
                completion(appropriateOrderPartList)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func getAllOrderPartsByOrderId(orderId: Int16, userId: String, access_token: String, completion: @escaping ([OrderPart])->Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.orderPartSection+"/by_order_id?order_id=\(orderId)&access_token=\(access_token)&user_ids=\(userId)"
        sessionManager.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let appropriateOrderPartList: [OrderPart] = try JSONDecoder().decode([OrderPart].self, from: data)
                completion(appropriateOrderPartList)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func updateCountInShoppingList(orderPartId: Int16, count: Int8, userId: String, access_token: String, completion: () -> Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.orderPartSection + "/update_count?order_part_id=\(orderPartId)&count=\(count)&user_ids=\(userId)&access_token=\(access_token)"
        sessionManager.request(urlString, method: .put)
        print("request on count updating for orderPartId = \(orderPartId) to count \(count)")
    }
    
    func AddProductToShoppingCart (partId: Int16, partProviderId: Int16, userId: String, access_token: String, completion: () -> Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.orderPartSection + "/add_order_part?part_provider_id=\(partProviderId)&part_id=\(partId)&user_ids=\(userId)&access_token=\(access_token)"
        sessionManager.request(urlString, method: .post)
        print("request on count updating for partId = \(partId) with part provider \(partProviderId)")    }
    
    func deleteProductsFromShoppingCartByStrIds(strOrderPartIds: String, userId: String, access_token: String, completion: () -> Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.orderPartSection + "/delete_multi_by_id?string_ids=\(strOrderPartIds)&user_ids=\(userId)&access_token=\(access_token)"
        sessionManager.request(urlString, method: .delete)
        print("request on deleting items from shopping cart with strIds \(strOrderPartIds)")
    }
    
    func proceedOrderFromInitalState(orderId: Int16, userId: String, access_token: String, completion: () -> Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.orderPartSection + "/perform_order?order_id=\(orderId)&user_ids=\(userId)&access_token=\(access_token)"
        sessionManager.request(urlString, method: .put)
        print("request on move order with id \(orderId) to Ordered state")
    }
}
