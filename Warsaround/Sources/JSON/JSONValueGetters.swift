//
//  JSONValueGetters.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

internal extension JSONValue {

    /// Gets NSNull
    ///
    /// - throws: UnexpectedValueType if value type is different then Null
    ///
    /// - returns: NSNull
    internal func null() throws -> NSNull {
        switch self {
            case .Null:
                return NSNull()
            default:
                throw JSONDeserializationError.UnexpectedValueType(actual: self.type, expected: .Null)
        }
    }

    /// Gets underlying Bool
    ///
    /// - throws: UnexpectedValueType if value type is different then Bool
    ///
    /// - returns: Bool

    internal func bool() throws -> Bool {
        switch self {
            case .Bool(let boolean):
                return boolean
            default:
                throw JSONDeserializationError.UnexpectedValueType(actual: self.type, expected: .Bool)
        }
    }

    /// Gets underlying NSNumber
    ///
    /// - throws: UnexpectedValueType if value type is different then Number
    ///
    /// - returns: NSNumber
    internal func number() throws -> NSNumber {
        switch self {
            case .Number(let number):
                return number
            default:
                throw JSONDeserializationError.UnexpectedValueType(actual: self.type, expected: .Number)
        }
    }

    /// Gets underlying String
    ///
    /// - throws: UnexpectedValueType if value type is different then String
    ///
    /// - returns: String
    internal func string() throws -> String {
        switch self {
            case .String(let string):
                return string
            default:
                throw JSONDeserializationError.UnexpectedValueType(actual: self.type, expected: .String)
        }
    }

    /// Gets underlying array of JSONValue
    ///
    /// - throws: UnexpectedValueType if value type is different then Array
    ///
    /// - returns: Array<JSONValue>
    internal func array() throws -> [JSONValue] {
        switch self {
            case .Array(let array):
                return array
            default:
                throw JSONDeserializationError.UnexpectedValueType(actual: self.type, expected: .Array)
        }
    }

    /// Gets underlying Dictionary [String: JSONValue]
    ///
    /// - throws: UnexpectedValueType if value type is different then Dictioary
    ///
    /// - returns: Dictionary<String, JSONValue>
    internal func dictionary() throws -> [String: JSONValue] {
        switch self {
            case .Dictionary(let dictionary):
                return dictionary
            default:
                throw JSONDeserializationError.UnexpectedValueType(actual: self.type, expected: .Dictionary)
        }
    }

}

internal extension JSONValue {

    /// Returns a value under the given key from the JSON dictionary.
    ///
    /// - Parameters:
    ///     - key: The key of the value.
    ///
    /// - Throws: `UnexpectedValueType` if the receiver is not a dictionary,
    ///           `MissingKey` if the key doesn't exist.
    ///
    /// - Returns: A JSON value.
    internal func get(_ key: String) throws -> JSONValue {
        guard case .Dictionary(let dictionary) = self else {
            throw JSONDeserializationError.UnexpectedValueType(actual: self.type, expected: .Dictionary)
        }
        guard let value = dictionary[key] else {
            throw JSONDeserializationError.MissingKey(key: key)
        }
        return value
    }
    
}
