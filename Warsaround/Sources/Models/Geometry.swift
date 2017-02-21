//
//  Geometry.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 21/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation
import CoreLocation

internal struct Geometry {

    let location: CLLocationCoordinate2D
    let viewPort: Viewport
}

extension Geometry: JSONValueDeserializable {
    init(deserializingFromJSONValue value: JSONValue) throws {
        let coordinates = try Location(deserializingFromJSONValue: value.get("location"))
        location = CLLocationCoordinate2D(latitude: coordinates.lat, longitude: coordinates.long)
        viewPort = try Viewport(deserializingFromJSONValue: value.get("viewport"))
    }
}
