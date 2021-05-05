//
//  Order.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 28.04.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

struct Order:Codable
{
    // MARK: - class fields
    public var id: Int16
    public var orderStatusID: Int16
    public var price: Decimal
    public var creationDate: Date
    public var changeDate: Date
    public var userID: Int16
    
     // MARK: - Coding keys
    enum CodingKeys: String, CodingKey {
        case id
        case order_status_id
        case price
        case creation_date
        case change_date
        case user_id
    }
    
    // MARK: - Decoder
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int16.self, forKey: .id)
        self.orderStatusID = try container.decode(Int16.self, forKey: .order_status_id)
        self.price = try container.decode(Decimal.self, forKey: .price)
        self.creationDate = try container.decode(Date.self, forKey: .creation_date)
        self.changeDate = try container.decode(Date.self, forKey: .change_date)
        self.userID = try container.decode(Int16.self, forKey: .user_id)
    }
    
    // MARK: - Encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(orderStatusID, forKey: .order_status_id)
        try container.encode(price, forKey: .price)
        try container.encode(creationDate, forKey: .creation_date)
        try container.encode(changeDate, forKey: .change_date)
        try container.encode(userID, forKey: .user_id)
    }
}
