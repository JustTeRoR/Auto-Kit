//
//  Vin.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 05.06.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

struct Vin: Decodable
{
    // MARK: - class fields
    public var id: Int16
    public var vin: String
    public var modelYearID: Int16
}
