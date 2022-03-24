//
//  UsersService.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 24.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation
import Combine

final class UsersService {
    
    private let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9." +
                            "eyJ1aWQiOiJmOTIwMjJlNi0zOTlmLTQzNDctOWE2YS01MzFhOGFhNDA5YTciLCJpZGVudGl0eSI6InRlc3QifQ." +
                                "sfSGoeSwzPCimh3I_IR6exolidJ95f-2DQLZYY61eWg"

    private func createRequest(for url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return request
    }

    func fetchUsers() -> AnyPublisher<UsersListResponse, Error> {
        guard let url = URL(string: "https://opn-interview-service.nn.r.appspot.com/list") else {
            fatalError("Cannot create url")
        }
        
        let request = createRequest(for: url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: UsersListResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchUserDetails(for id: String) -> AnyPublisher<UserDetailsResponse, Error> {
        guard let url = URL(string: "https://opn-interview-service.nn.r.appspot.com/get/\(id)") else {
            fatalError("Cannot create url")
        }
        
        let request = createRequest(for: url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: UserDetailsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
