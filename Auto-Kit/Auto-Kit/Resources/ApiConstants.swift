//
//  ApiConstants.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 28.04.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

enum ApiConstants {
    //MARK: vk's part
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.92"
    static let user = "/method/users.get"
    //MARK: Auto-Kit-backend's part
    static let baseUrl = "https://localhost:8443/auto_kit/api/"
    static let partSection = "part"
    static let replaceabilitySection = "replaceability"
    static let orderPartSection = "order_part"
    static let orderSection = "order"
    static let vinSection = "vin"
    static let modelYearSection = "model_year"
    static let categorySection = "part_type"
    static let partModelYearSection = "part_model_year"
}
