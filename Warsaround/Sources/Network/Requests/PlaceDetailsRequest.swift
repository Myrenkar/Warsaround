//
//  PlaceDetailsRequest.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 22/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

internal struct PlaceDetailsRequest: APIRequest {

    private let APIKey = "AIzaSyAeEZ2NRyzVmW8IbWcq4J38PheUKfRK-2w"

    var path: String

    init(withPlace place: Place) {
        path  = "details/json?reference=\(place.reference)&sensor=true&key=\(APIKey)"
    }
}
