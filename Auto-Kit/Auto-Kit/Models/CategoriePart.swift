//
//  CategoriePart.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 05.06.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

struct CategoriePart: Decodable
{
    // MARK: - class fields
    public var id: Int16
    public var modelYearId: Int16
    public var partTypeId: Int16
    public var partTypeName: String
    public var measure_id: Int16
    public var oem_part_id: Int16
    public var labour: Int16
    public var quantity: Int16
    public var partName: String
    public var serialNumber: String
}
