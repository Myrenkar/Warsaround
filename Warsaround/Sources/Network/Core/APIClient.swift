//
//  APIClient.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import RxSwift

internal protocol APIClient {
    /// perform specific Request and returns Observable
    ///
    /// - Parameter request: request to be performed
    /// - Returns:  Observable - tuple of Data and HTTPURLResponse
    func send(request: APIRequest) -> Observable<APIResponse>
}
