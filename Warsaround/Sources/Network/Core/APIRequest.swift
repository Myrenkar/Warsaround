//
//  APIRequest.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

internal enum Method: String {
    case GET, POST, PUT, DELETE
}

internal protocol APIRequest {

    var method: Method { get }

    var path: String { get }

    var query: APIQuery? { get }

    var JSON: JSONValue? { get }

    /// API service where the request will be send to
    var service: APIService { get }

    /// Additional part of host that is about to be a part of path defining API version
    var version: String { get }
}
