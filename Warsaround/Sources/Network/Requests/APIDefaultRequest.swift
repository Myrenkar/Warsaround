//
//  APIDefaultRequest.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

/// Defaults for any api request
extension APIRequest {

    /// Every request should use v1 of the api by default
    var version: String { return "" }

    /// Default service depends on build configuration - currently only staging
    internal var service: APIService {
        return DevelopmentAPIService()
    }

    var method: Method { return .GET }
    var query: APIQuery? { return nil }
    var JSON: JSONValue? { return nil }
}
