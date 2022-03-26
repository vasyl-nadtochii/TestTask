//
//  String.swift
//  TestTask
//
//  Created by Vasyl Nadtochii on 26.03.2022.
//  Copyright (c) 2022 StarGo. All rights reserved.
//

import Foundation

extension String {

    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }

    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }

}
