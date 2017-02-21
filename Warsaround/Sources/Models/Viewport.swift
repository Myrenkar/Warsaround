//
//  Viewport.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 21/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation


typealias NorthEast = Location
typealias SouthWest = Location


internal struct Viewport {
    let northEast: NorthEast
    let southWest: SouthWest
}

extension Viewport: JSONValueDeserializable {

    init(deserializingFromJSONValue json: JSONValue) throws {
        northEast = try json.get("northeast").serializeToAnyObject() as! NorthEast
        southWest = try json.get("southwest").serializeToAnyObject() as! SouthWest
    }
}
