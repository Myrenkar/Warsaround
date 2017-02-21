//
//  JSONSerializableDictionary.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 21/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

/// A JSON dictionary type.
internal typealias JSONSerializableDictionary = [String: JSONValueSerializable?]

/// Represents a value that can be converted into a JSON dictionary value.
internal protocol JSONDictionarySerializable: JSONValueSerializable {

    /// Serializes `self` to a `[String: JSONValueSerializable]` dictionary.
    ///
    /// - Throws: Any error that occurred during serialization.
    ///
    /// - Returns: A serialized `[String: JSONValueSsreializable?]` dictionary
    /// representation of `self`.
    func serializeToJSONDictionary() throws -> JSONSerializableDictionary

}

// MARK: -

internal extension JSONDictionarySerializable {

    /// - SeeAlso: JSONValueSerializable.serializeToJSONValue()
    internal func serializeToJSONValue() throws -> JSONValue {
        return try JSONValue(dictionary: try serializeToJSONDictionary())
    }
    
}
