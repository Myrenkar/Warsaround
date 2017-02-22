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
    init(deserializingFromJSONValue value: JSONValue) throws {
        long = try value.get("lng").number().doubleValue
        lat = try value.get("lat").number().doubleValue
    }
}
