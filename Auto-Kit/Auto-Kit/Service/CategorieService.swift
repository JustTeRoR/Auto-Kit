//
//  CategorieService.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 04.06.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import Alamofire

class CategorieService {

    private let authService: AuthService
    private let sessionManager: SessionManager
    init(authService: AuthService = AppDelegate.shared().authService, SessionManager: SessionManager) {
        self.authService = authService
        self.sessionManager = SessionManager
    }
    
    func getAllCategories(userId: String, access_token: String, completion: @escaping ([Categorie])->Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.categorySection + "/all?user_ids=\(userId)&access_token=\(access_token)"
        sessionManager.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let allCategoryList: [Categorie] = try JSONDecoder().decode([Categorie].self, from: data)
                completion(allCategoryList)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
}
