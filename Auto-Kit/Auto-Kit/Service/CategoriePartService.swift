//
//  CategoriePartService.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 05.06.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import Alamofire

class CategoriePartService {
    private let authService: AuthService
    private let sessionManager: SessionManager
    init(authService: AuthService = AppDelegate.shared().authService, SessionManager: SessionManager) {
        self.authService = authService
        self.sessionManager = SessionManager
    }
    
    func getAllPartsByCategorie(categorieId: Int16, modelAutomobileId: Int16, userId: String, access_token: String, completion: @escaping ([CategoriePart])->Void) {
        let urlString = ApiConstants.baseUrl + ApiConstants.partModelYearSection + "/by_part_type_and_model_year?part_type_id=\(categorieId)&model_year_id=\(modelAutomobileId)&user_ids=\(userId)&access_token=\(access_token)"
        sessionManager.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let allCategoryPartList: [CategoriePart] = try JSONDecoder().decode([CategoriePart].self, from: data)
                completion(allCategoryPartList)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
