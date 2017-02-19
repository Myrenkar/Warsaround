//
//  APIError.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation


/// Describes errors resulted from API request
///
/// - Connection:    Connection error, i.e. Host unreachable (-1001)
/// - Authorization: Response status code was 401 - authorization failure
/// - ResponseError: Indicates problem with response
/// - NoResponse:    Response was missing or not HTTP response
internal enum APIClientError: Error {
    case Connection(error: Error)
    case Authorization(error : Error?)
    case ResponseError(error: APIResponseError)
    case NoResponse
}


/// Describes any error that may occure during creating request
///
/// - IncorrectURL: Indicated incorrect URL; URL might failed to be created for given base URL, root, version or path
internal enum APIRequestError: Error {
    case IncorrectURL(url: String)
}

/// Describes errors resulted from processing response itself
///
/// - MissingData:          Data from response was missing
/// - IncorrectData:        Data from response could not be processed
/// - UnexpectedStatusCode: Response status code was not an expected code by APIClient
internal enum APIResponseError: Error {
    case MissingData
    case IncorrectData(error: Error)
    case UnexpectedStatusCode(statusCode: Int)
}
