//
//  MainModels.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 02.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
import UIKit

enum AutoKit {

    enum Model {
        struct Request {
            enum RequestType {
                case getUser
            }
        }
        struct Response {
            enum ResponseType {
                case presentUserInfo(user: UserResponse?)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayUser(userViewModel: UserViewModel)
            }
        }
    }
}

struct UserViewModel: TitleViewViewModel {
    var photoUrlString: String?
    var name: String
}
