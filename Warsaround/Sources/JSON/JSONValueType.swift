//
//  JSONValueType.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

/// Defines JSONValue type
///
/// - Null:       null type
/// - Bool:       boolean type
/// - Number:     number type
/// - String:     string type
/// - Array:      array type
/// - Dictionary: dictionary type
internal enum JSONValueType {
    case Null, Bool, Number, String, Array, Dictionary
}

internal extension JSONValue {

    /// Returns type of JSONValue
    internal var type: JSONValueType {
        switch self {
        case .Null: return .Null
        case .Bool: return .Bool
        case .Number: return .Number
        case .String: return .String
        case .Array: return .Array
        case .Dictionary: return .Dictionary
        }
    }
}
