//
//  Part.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 03.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

struct PartsWrapped: Decodable {
    let parts: [Part]
}

struct Part: Decodable {
    let id: Int16
    let quantity: Int8
    let measureId: Int16
    let makeId: Int16
    let partTypeId: Int16
    let oem: Bool
    let lastPurchasePrice: Decimal
    //let last_delivery_time: Date
    let serialNumber: String
}
