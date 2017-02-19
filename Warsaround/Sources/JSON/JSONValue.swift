//
//  JSONValue.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

/// Represent possible JSON values
///
/// - Null: Null in JSON
/// - Bool: Bool in JSON
/// - Number: Number value in JSON
/// - String: String value in JSON
/// - Array: Array value
/// - Dictionary: Dictionary value
internal enum JSONValue {
    case Null
    case Bool(Swift.Bool)
    case Number(NSNumber)
    case String(Swift.String)
    case Array([JSONValue])
    case Dictionary([String: JSONValue])
}

extension JSONValue {

    /// Initialize JSON
    ///
    /// - Parameter object: object used for initialization
    /// - throws: JSONDeserializationError.UnsupportedObjectType
    /// - returns: Initialized Self
    internal init(object: AnyObject) throws {
        switch object {
            case is NSNull:
                self = .Null
            case let number as NSNumber where CFGetTypeID(object) == CFBooleanGetTypeID():
                self = .Bool(number.boolValue)
            case let number as NSNumber:
                self = .Number(number)
            case let string as String:
                self = .String(string)
            case let array as [AnyObject]:
                self = try .Array(array.map(JSONValue.init(object:)))
            case let dictionary as [String: AnyObject]:
                self = .Dictionary(try dictionary.flatMapKeysAndValues { ($0.0, try JSONValue(object: $0.1)) })
            default:
                throw JSONDeserializationError.UnsupportedObjectType(type: type(of: object))
        }
    }


    /// Serializes to AnyObject
    ///
    /// - Returns: AnyObject representation of Self
    internal func serializeToAnyObject() -> AnyObject {
        switch self {
            case .Null:
                return NSNull()
            case .Bool(let bool):
                return bool as NSNumber
            case .Number(let number):
                return number as NSNumber
            case .String(let string):
                return string as NSString
            case .Array(let array):
                return array.map { $0.serializeToAnyObject() } as AnyObject
            case .Dictionary(let dictionary):
                return dictionary.flatMapKeysAndValues { ($0.0, $0.1.serializeToAnyObject()) } as NSDictionary
        }
    }

    /// Serializes JSON to Data
    /// inverse of `self.init(data:)`.
    /// - Parameter options: JSONSerialization options
    /// - Returns:  A `NSData` representation of `self`.
    internal func serializeToData(options: JSONSerialization.WritingOptions = .prettyPrinted) throws -> Data {
        return try JSONSerialization.data(withJSONObject: serializeToAnyObject(), options: options)
    }
}

extension JSONValue {
    internal init(data: Data) throws {
        let object = try JSONSerialization.jsonObject(with: data, options: [])
        try self.init(object: object as AnyObject)
    }
}


extension JSONValue: Equatable {}

internal func ==(lhs: JSONValue, rhs: JSONValue) -> Bool {
    switch (lhs, rhs) {
        case (.Null, .Null):
            return true
        case (.Bool(let lhs), .Bool(let rhs)):
            return lhs == rhs
        case (.Number(let lhs), .Number(let rhs)):
            return lhs == rhs
        case (.String(let lhs), .String(let rhs)):
            return lhs == rhs
        case (.Array(let lhs), .Array(let rhs)):
            return lhs == rhs
        case (.Dictionary(let lhs), .Dictionary(let rhs)):
            return lhs == rhs
        default:
            return false
    }
}
