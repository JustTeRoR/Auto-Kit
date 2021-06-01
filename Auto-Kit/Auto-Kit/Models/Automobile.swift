//
//  Automobile.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 31.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

struct Automobile: Decodable
{
    // MARK: - class fields
    public var vin: String
    public var year: String
    public var make: String
    public var model: String
    public var engine: String
    public var style: String
    public var made_in: String
    public var drive_type: String
    public var transmission: String
    public var fuel_type: String
}
