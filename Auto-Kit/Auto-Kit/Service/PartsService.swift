//
//  PartsService.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 03.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import Alamofire

class PartsService {
    
    private let authService: AuthService
    private let sessionManager: SessionManager
    init(authService: AuthService = AppDelegate.shared().authService, SessionManager: SessionManager) {
        self.authService = authService
        self.sessionManager = SessionManager
    }
    
    func allPartsBySerialNumber(query: String, userId: String, access_token: String, completion: @escaping ([Part])->Void) {
        
        let urlString = ApiConstants.baseUrl + ApiConstants.partSection + "/by_serial_number?serial_number=" + query + "&v=5.92&user_ids=" + userId + "&access_token="+access_token
        sessionManager.request(urlString).response { response in
            guard let data = response.data else { return }
            let appropriatePartList: [Part] = try! JSONDecoder().decode([Part].self, from: data)
            completion(appropriatePartList)
        }
    }
    
}

