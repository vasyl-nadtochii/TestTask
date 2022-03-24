//
//  UserDetailsViewModel.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 23.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation
import Combine

class UserDetailsViewModel: ObservableObject, Identifiable {
    let userDetails: UserDetails
    
    init(userDetails: UserDetails) {
        self.userDetails = userDetails
    }
}
