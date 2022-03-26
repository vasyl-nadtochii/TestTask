//
//  Data.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 26.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation

extension Data {
    func urlSafeBase64EncodedString() -> String {
        return base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}
