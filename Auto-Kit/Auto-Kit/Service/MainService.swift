//
//  MainService.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 02.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import UIKit

class MainService {
    var authService: AuthService
    var networking: Networking
    var fetcher: DataFetcher
    
    init() {
        self.authService = AppDelegate.shared().authService
        self.networking = NetworkService(authService: authService)
        self.fetcher = NetworkDataFetcher(networking: networking)
    }

    func getUser(completion: @escaping (UserResponse?) -> Void) {
        fetcher.getUser { (userResponse) in
            completion(userResponse)
        }
    }
}
