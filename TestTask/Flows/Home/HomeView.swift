//
//  HomeView.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 23.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewModel()
    
    var usersList: some View {
        Group {
            if viewModel.fetchedData {
                List(viewModel.details) { details in
                    NavigationLink {
                        UserDetailsView(viewModel: UserDetailsViewModel(userDetails: details))
                    } label: {
                        Text(details.firstName)
                    }
                }
                .listStyle(GroupedListStyle())
                .refreshable {
                    viewModel.fetchUserIDs()
                }
            } else {
                if viewModel.errorMessage.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    Text("Error occured :(")
                        .foregroundColor(.secondary)
                }
            }
        }
        .onAppear(perform: {
            if !viewModel.fetchedData {
                self.viewModel.fetchUserIDs()
            }
        })
    }

    var body: some View {
        NavigationView {
            usersList
                .navigationTitle("Home")
                .alert(viewModel.errorMessage, isPresented: $viewModel.showingAlert) {
                    Button("OK", role: .cancel) { }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
