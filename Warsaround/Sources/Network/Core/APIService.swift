//
//  APIService.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

/// Defines scheme to be used for the service
internal enum Scheme: String {
    case HTTP = "http"
    case HTTPS = "https"
}

/// Defines interface for basic API service
internal protocol APIService {

    /// Connection scheme: http/https or different if needed; default https
    var scheme: Scheme { get }

    /// Base URL expressed as String
    var host: String { get }

    /// Root to the Rest API
    var root: String { get }

}

/// Defines interface for API service that requires port to be specified for successful connection
internal protocol APIServicePortSpecific: APIService {

    /// Port for the host
    var port: Int { get }

}

// MARK: - APIService defaults

extension APIService {

    /// Default scheme is secure HTTP
    var scheme: Scheme { return .HTTPS }
}
