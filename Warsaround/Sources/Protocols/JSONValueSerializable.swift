//
//  JSONValueSerializable.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 21/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

/// Represents a value that can be converted into a JSON value.
internal protocol JSONValueSerializable {

    /// Serializes `self` to a `JSONValue`.
    ///
    /// - Throws: Any error that occurred during serialization.
    ///
    /// - Returns: A serialized `JSONValue` representation of `self`.
    func serializeToJSONValue() throws -> JSONValue
    
}
