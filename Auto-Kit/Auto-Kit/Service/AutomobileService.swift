//
//  AutomobileService.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 31.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import Alamofire

class AutomobileService {

    private let authService: AuthService
    private let sessionManager: SessionManager
    init(authService: AuthService = AppDelegate.shared().authService, SessionManager: SessionManager) {
        self.authService = authService
        self.sessionManager = SessionManager
    }
    
    func parseVinNumberIntoCarDetails(vin: String, userId: String, access_token: String, completion: @escaping (Automobile)->Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.vinSection + "/parseVin?user_ids=\(userId)&access_token=\(access_token)&vin=\(vin)"
        sessionManager.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let parsedAutomobile: Automobile = try JSONDecoder().decode(Automobile.self, from: data)
                completion(parsedAutomobile)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func parseAllUsersAutomobiles(userId: String, access_token: String, completion: @escaping ([Automobile])->Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.modelYearSection + "/by_user_id?user_ids=\(userId)&access_token=\(access_token)"
        sessionManager.request(urlString).response { response in
            print(response)
            guard let data = response.data else { return }
            do {
                let parsedAutomobileList: [Automobile] = try JSONDecoder().decode([Automobile].self, from: data)
                completion(parsedAutomobileList)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
}
