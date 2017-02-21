//
//  PlaceDetails.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 22/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

internal struct PlaceDetails {

    let phoneNumber: String
    let website: String
}

extension PlaceDetails: JSONValueDeserializable {

    internal init(deserializingFromJSONValue value: JSONValue) throws {
        phoneNumber = try value.get("formatted_phone_number").string()
        website = try value.get("website").string()
    }
}
