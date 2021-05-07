//
//  Order.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 28.04.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

struct Order: Decodable
{
    // MARK: - class fields
    public var id: Int16
    public var orderStatusId: Int16
    public var statusKey: String
    public var statusName: String
    public var price: Decimal
    public var creationDate: String
    public var changeDate: String
    public var userId: Int64
    public var userName: String
}
