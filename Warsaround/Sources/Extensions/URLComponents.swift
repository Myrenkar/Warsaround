//
//  URLComponents.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

// MARK: - URLComponents convenience initializer for APIRequest
extension URLComponents {

    /// Convenience initalizer for APIRequest
    ///
    /// - parameter request: a type conforming to APIRequest
    ///
    /// - returns: Initialized URLComponents
    init(request: APIRequest) {
        self = {
            var components = URLComponents()
            components.scheme = request.service.scheme.rawValue
            components.host = request.service.host

            if let service = request.service as? APIServicePortSpecific {
                components.port = service.port
            }

            components.path = "/" + NSString.path(withComponents: [
                request.service.root,
                request.version,
                request.path
                ])

            components.queryItems = request.query?.items

            return components
        }()
    }
    
}
