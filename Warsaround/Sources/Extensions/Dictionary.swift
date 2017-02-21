//
//  Dictionary.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

internal extension Dictionary {

    /// Flat maps over keys and values of Dictionary returning new, transformed Dictionary
    ///
    /// - parameter transform: transformation to be applied on keys and values of Dictionary
    ///
    /// - throws: Rethrows transformation errors
    ///
    /// - returns: New Dictionary with non-nil values transformed using provided transformation
    internal func flatMapKeysAndValues<K: Hashable, V>(transform: (Key, Value) throws -> (K, V)?) rethrows -> [K: V] {
        var memo = Dictionary<K, V>(minimumCapacity: count)
        try flatMap { try transform($0, $1) }.forEach { memo[$0.0] = $0.1 }
        return memo
    }
}
