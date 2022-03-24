//
//  UsersListResponse.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 23.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation

struct UsersListResponse: Codable {
    let userIDs: [String]
    
    enum CodingKeys: String, CodingKey {
        case userIDs = "data"
    }
}
