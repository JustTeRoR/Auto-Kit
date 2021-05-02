//
//  UserResponse.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 01.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation
struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let firstName: String
    let lastName: String
    let photo100: String?

    var name: String { return firstName + " " + lastName }
}
