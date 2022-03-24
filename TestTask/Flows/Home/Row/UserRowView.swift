//
//  UserRowView.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 24.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import SwiftUI

struct UserRowView: View {
    @ObservedObject var viewModel: UserRowViewModel

    var body: some View {
        Text(viewModel.isUserDeleted ? "Deleted User" : viewModel.firstName)
            .onAppear(perform: { viewModel.getUserDetails() })
            .foregroundColor(viewModel.isUserDeleted ? .red : .primary)
    }
}
