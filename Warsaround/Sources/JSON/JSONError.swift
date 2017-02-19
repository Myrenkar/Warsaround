//
//  JSONError.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

/// Desibers error while serializing JSON
///
/// - UnserializableType: Given type could not be serialized
internal enum JSONSerializationError: Error {
    case UnserializableType(type: Any.Type)
}

/// Describes error while deserializing JSON
///
/// - UnsupportedObjectType: JSONValue could not be deserialized to object of a given type
/// - MissingKey:            JSON does not include value for given key
/// - UnexpectedValueType:   The value type was different then expected
internal enum JSONDeserializationError: Error {
    case UnsupportedObjectType(type: Any.Type)
    case MissingKey(key: String)
    case UnexpectedValueType(actual: JSONValueType, expected: JSONValueType)
}
