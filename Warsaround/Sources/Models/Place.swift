//
//  Place.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 28/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation
import CoreLocation
import HDAugmentedReality

internal class Place: ARAnnotation {
    let reference: String
    let placeName: String
    let address: String

    var phoneNumber: String?
    var website: String?
    var icon: String?
    var geometry: Geometry?
    var placeDetails: PlaceDetails?

    var infoText: String {
        get {
            var info = "Address: \(address)"

            if phoneNumber != nil {
                info += "\nPhone: \(phoneNumber!)"
            }

            if website != nil {
                info += "\nweb: \(website!)"
            }
            return info
        }
    }

    init(location: CLLocation, reference: String, name: String, address: String) {
        placeName = name
        self.reference = reference
        self.address = address

        super.init()

        self.location = location
    }

    init(json: JSONValue) throws {
        placeName = try json.get("name").string()
        address = try json.get("vicinity").string()
        reference = try json.get("reference").string()
        icon = try json.get("icon").string()
        geometry = try Geometry(deserializingFromJSONValue: json.get("geometry"))

        super.init()

        guard let geometry = geometry else { return }
        self.location = CLLocation(latitude: geometry.location.latitude, longitude: geometry.location.longitude)
    }

    override var description: String {
        return placeName
    }
}
