//
//  PlacesRequest.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

internal struct PlacesRequest: APIRequest {

    private let APIKey = "AIzaSyAeEZ2NRyzVmW8IbWcq4J38PheUKfRK-2w"

    let lattitude: Double
    let longitude: Double
    let radius: Int

    let path: String

    internal init(lattitude: Double, longitude: Double, radius: Int) {
        self.lattitude = lattitude
        self.longitude = longitude
        self.radius = radius
        path = "place/nearbysearch/json?location=\(self.lattitude),\(self.longitude)&radius=\(self.radius)&sensor=true&types=establishment&key=\(APIKey)"
    }
}
