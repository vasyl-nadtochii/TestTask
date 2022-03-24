//
//  UserDetailsView.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 23.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    var viewModel: UserDetailsViewModel

    var body: some View {
        VStack {
            Text("Name: \(viewModel.userDetails.firstName) \(viewModel.userDetails.lastName)")
            Text("Age: \(viewModel.userDetails.age)")
            Text("Gender: \(viewModel.userDetails.gender)")
            Text("Country: \(viewModel.userDetails.country)")
        }
        .navigationTitle("User's Information")
        .navigationBarTitleDisplayMode(.inline)
    }
}
