//
//  URLRequest.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

// MARK: - URLRequest convenience initializer for APIRequest
extension URLRequest {

    /// Convenience initializer for APIReuqest
    ///
    /// - parameter request: a type conforming to APIRequest
    ///
    /// - throws: APIRequestError.IncorrectURL when url could not be created
    ///
    /// - returns: Initialized URLRequest
    init(request: APIRequest) throws {
        guard let url =  URLComponents(request: request).url else {
            throw APIRequestError.IncorrectURL(url: request.path)
        }

        let stringURL = String(describing: url).removingPercentEncoding
        let newUrl = URL(string: stringURL!)

        self.init(url: newUrl!)

        httpMethod = request.method.rawValue

        // Default headers
        allHTTPHeaderFields = [
            "Content-Type": "application/json; charset=utf-8",
        ]

        httpBody = try request.JSON?.serializeToData()
    }
}
