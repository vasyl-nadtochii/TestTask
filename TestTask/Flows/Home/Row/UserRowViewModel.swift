//
//  UserRowViewModel.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 24.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation
import Combine

class UserRowViewModel: ObservableObject {
    let id: String
    var cancellable: AnyCancellable?
    let usersService: UsersService

    @Published var firstName: String = ""
    @Published var isUserDeleted: Bool = false

    var userDetails: UserDetails?
    
    init(id: String,
         usersService: UsersService) {
        self.id = id
        self.usersService = usersService
    }
}

extension UserRowViewModel {
    func getUserDetails() {
        cancellable = usersService.fetchUserDetails(for: id).sink(receiveCompletion: { _ in }, receiveValue: { userDetails in
            if userDetails.status != "error" {
                self.userDetails = userDetails.data
                self.firstName = userDetails.data.firstName
                print(userDetails.data.firstName)
            } else {
                self.isUserDeleted = true
                print(self.id)
            }
        })
    }
}
