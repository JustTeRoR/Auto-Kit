//
//  OrderService.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 07.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import Alamofire

class OrderService {
    
    private let authService: AuthService
    private let sessionManager: SessionManager
    init(authService: AuthService = AppDelegate.shared().authService, SessionManager: SessionManager) {
        self.authService = authService
        self.sessionManager = SessionManager
    }
    
    func rejectOrderByUser(orderId: Int16, userId: String, access_token: String, completion: () -> Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.orderSection + "/cancel_by_user?order_id=\(orderId)&user_ids=\(userId)&access_token=\(access_token)"
        sessionManager.request(urlString, method: .put)
        print("request on rejecting order by user for order_id = \(orderId)")
    }
    
    func getAllOrdersByUserId(userId: String, access_token: String, completion: @escaping ([Order])->Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.orderSection+"/by_user_id?user_ids=\(userId)&access_token=\(access_token)"
        sessionManager.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let appropriateOrderList: [Order] = try JSONDecoder().decode([Order].self, from: data)
                completion(appropriateOrderList)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
}
