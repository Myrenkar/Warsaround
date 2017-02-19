//
//  APIQuery.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

/// Represents value in key-value query string format
typealias QueryValue = String

/// Defines APIQuery interface
internal protocol APIQuery {
    /// Query items to be added to request
    var items: [URLQueryItem] { get }
}

/// A type with a query string value representation.
internal protocol APIQueryValueConvertible {

    /// Value to be used in query string along with key
    var queryValue: QueryValue { get }
}

/// Declares most obvious and basic conformonce by utilizing `String.init<T>(T)`
internal extension APIQueryValueConvertible {
    var queryValue: QueryValue {
        return String(describing: self)
    }
}

// MARK: - Primitives conformance
extension Int: APIQueryValueConvertible {}
extension Int8: APIQueryValueConvertible {}
extension Int16: APIQueryValueConvertible {}
extension Int32: APIQueryValueConvertible {}
extension Int64: APIQueryValueConvertible {}

extension UInt: APIQueryValueConvertible {}
extension UInt8: APIQueryValueConvertible {}
extension UInt16: APIQueryValueConvertible {}
extension UInt32: APIQueryValueConvertible {}
extension UInt64: APIQueryValueConvertible {}

extension Float: APIQueryValueConvertible {}
extension Double: APIQueryValueConvertible {}
extension Bool: APIQueryValueConvertible {}

// MARK: - Foundation objects conformance
extension NSNumber: APIQueryValueConvertible {}
extension NSNull: APIQueryValueConvertible {
    var queryValue: QueryValue { return "null" }
}

// MARK: - Standard Lib structs conformance
extension String: APIQueryValueConvertible {}

