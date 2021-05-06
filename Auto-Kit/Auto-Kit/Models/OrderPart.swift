//
//  File.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 28.04.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

struct OrderPart: Decodable
{
    // MARK: - class fields
    public var id: Int16
    public var orderId: Int16
    public var orderPartStatusId: Int16
    public var orderPartStatusTitle: String
    public var partProviderId: Int16
    public var partProviderName: String
    public var purchasePrice: Decimal
    public var price: Decimal
    public var labourPrice: Decimal
    public var count: Int8
    public var partId: Int16
    public var serialNumber: String
}
