//
//  ServiceErrors.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 03.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

enum ServerError : Error {
    case noDataProvided
    case failedToDecode
    case noResponseFromServer
}
