//
//  JSONValueDeserializable.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 21/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//


/// Represnets a type that can be deserialized from a JSON value.
internal protocol JSONValueDeserializable {

    /// Initializes the receiver from its `JSONValue` representation.
    ///
    /// - Parameters:
    ///     - value: The `JSONValue` representation of `self`.
    ///
    /// - Throws: Any error that occured during deserialization.
    ///
    /// - Returns: An initialized instance of the receiver.
    init(deserializingFromJSONValue value: JSONValue) throws
    
}
