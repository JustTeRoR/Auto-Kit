//
//  File.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 28.04.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

struct OrderPart:Codable
{
    // MARK: - class fields
    public var id: Int16
    public var orderID: Int16
    public var orderPartStatusID: Int16
    public var partProviderID: Int16
    public var purhcasePrice: Decimal
    public var price: Decimal
    public var labourPrice: Decimal
    public var count: Int
    public var partID: Int16
    
    // MARK: - Coding keys
    enum CodingKeys: String, CodingKey {
        case id
        case order_id
        case order_part_status_id
        case part_provider_id
        case purchase_price
        case price
        case labour_price
        case count
        case part_id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int16.self, forKey: .id)
        self.orderID = try container.decode(Int16.self, forKey: .order_id)
        self.orderPartStatusID = try container.decode(Int16.self, forKey: .order_part_status_id)
        self.partProviderID = try container.decode(Int16.self, forKey: .part_provider_id)
        self.purhcasePrice = try container.decode(Decimal.self, forKey: .purchase_price)
        self.price = try container.decode(Decimal.self, forKey: .price)
        self.labourPrice = try container.decode(Decimal.self, forKey: .labour_price)
        self.count = try container.decode(Int.self, forKey: .count)
        self.partID = try container.decode(Int16.self, forKey: .part_id)
    }
    
    // MARK: - Encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(orderID, forKey: .order_id)
        try container.encode(orderPartStatusID, forKey: .order_part_status_id)
        try container.encode(partProviderID, forKey: .id)
        try container.encode(purhcasePrice, forKey: .part_provider_id)
        try container.encode(price, forKey: .price)
        try container.encode(labourPrice, forKey: .labour_price)
        try container.encode(count, forKey: .count)
        try container.encode(partID, forKey: .part_id)
    }
}
