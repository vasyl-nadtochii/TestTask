//
//  HomeViewModel.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 23.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation
import Combine
import Network

class HomeViewModel: ObservableObject {
    let usersService = UsersService()

    var cancellable: AnyCancellable?
    var cancellables = Set<AnyCancellable>()

    @Published var fetchedData = false
    @Published var showingAlert = false
    @Published var errorMessage = ""

    @Published var ids: [String] = []
    @Published var details: [UserDetails] = []
}

extension HomeViewModel {
    func fetchUserIDs() {
        cancellable = usersService.fetchUsers()
            .mapError({ [weak self] (error) -> Error in
                self?.errorMessage = error.localizedDescription
                self?.showingAlert = true
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] users in
                self?.ids = users.userIDs.filter { UUID(uuidString: $0) != nil }
                self?.fetchUserDetails()
            })
    }
    
    private func fetchUserDetails() {
        let group = DispatchGroup()

        for id in ids {
            group.enter()
            cancellables.insert(usersService.fetchUserDetails(for: id)
                                    .sink(receiveCompletion: { _ in
                group.leave()
            }, receiveValue: { [weak self] userDetails in
                if let self = self, !self.details.contains(where: { $0 == userDetails.data }) {
                    self.details.append(userDetails.data)
                }
            }))
        }
        
        group.notify(queue: .main) {
            self.fetchedData = true
        }
    }
}
