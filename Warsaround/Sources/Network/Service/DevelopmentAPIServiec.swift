//
//  DevelopmentAPIServiec.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

internal struct DevelopmentAPIService: APIService {

    /// The host is staging
    var host: String { return "maps.googleapis.com/maps/api" }

    /// The root is "api"
    let root: String

    /// Initialize api service with a root path
    ///
    /// - parameter rootPath: root path for the serivce
    ///
    /// - returns: Initialized api service
    init(rootPath: String = "") {
        root = rootPath
    }
}
