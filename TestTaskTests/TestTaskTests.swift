//
//  TestTaskTests.swift
//  TestTaskTests
//
//  Created by Vasyl Nadtochii on 24.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//


import XCTest
@testable import TestTask

class TestTaskTests: XCTestCase {
    
    var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        try super.tearDownWithError()
    }
    
    func testIsFetched() throws {
        XCTAssert(!viewModel.fetchedData)
        
        let promise = expectation(description: "fetched count should be 14")
        viewModel.fetchUserIDs()

        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            promise.fulfill()
        }
        wait(for: [promise], timeout: 10)

        XCTAssert(viewModel.fetchedData)
        XCTAssertEqual(viewModel.ids.count, viewModel.details.count)
        XCTAssertEqual(viewModel.ids.count, 14)
        print(viewModel.ids.count)
    }
}
