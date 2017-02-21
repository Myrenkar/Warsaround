//
//  Location.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 21/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

internal struct Location {
    let long: Double
    let lat: Double
}

extension Location: JSONValueDeserializable {
    init(deserializingFromJSONValue json: JSONValue) throws {
        long = try json.get("lng").number().doubleValue
        lat = try json.get("lat").number().doubleValue
    }
}
