//
//  UserDetailsResponse.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 23.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation

struct UserDetailsResponse: Codable {
    let status: String
    let data: UserDetails
}

struct UserDetails: Codable, Identifiable, Equatable {
    let id: String
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let country: String
}
