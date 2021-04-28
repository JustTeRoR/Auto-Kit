//
//  User.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 28.04.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import Foundation

struct User:Codable
{
    // MARK: - class fields
    public var id: Int16
    public var phone: String
    public var username: String
    public var role: String
    
     // MARK: - Coding keys
    enum CodingKeys: String, CodingKey {
        case id
        case phone
        case username
        case role
    }
    
    // MARK: - Decoder
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int16.self, forKey: .id)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.username = try container.decode(String.self, forKey: .username)
        self.role = try container.decode(String.self, forKey: .role)
    }
    
    // MARK: - Encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(phone, forKey: .phone)
        try container.encode(username, forKey: .username)
        try container.encode(role, forKey: .role)
    }
}
