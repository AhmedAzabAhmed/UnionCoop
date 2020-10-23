//
//  DictionaryEncoder.swift
//  UnionCoop
//
//  Created by azab on 10/21/20.
//  Copyright © 2020 azab. All rights reserved.
//

import Foundation

struct DictionaryEncoder {
    static func encode<T>(_ value: T) throws -> [String: Any] where T: Encodable {
        let jsonData = try JSONEncoder().encode(value)
        return try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] ?? [:]
    }
}
