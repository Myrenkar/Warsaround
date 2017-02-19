//
//  DefaultAPIClient.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation
import RxSwift

internal final class DefaultAPIClient: APIClient {

    fileprivate let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func send(request: APIRequest) -> Observable<APIResponse> {
        return perform(request: request)
    }

    fileprivate func perform(request: APIRequest) -> Observable<APIResponse> {
        return Observable.create { [unowned self] observer in

            do {
                let urlRequest = try URLRequest(request: request)


                let task = self.session.dataTask(with: urlRequest) { data, response, error in
                    if let error = error {
                        observer.onError(error)
                    } else if let response = response as? HTTPURLResponse {
                        if 200..<300 ~= response.statusCode {
                            observer.onNext(APIResponse(data: data, response: response))
                            observer.onCompleted()
                        } else {
                            observer.onError(
                                APIClientError.ResponseError(error: .UnexpectedStatusCode(statusCode: response.statusCode))
                            )
                        }

                    } else {
                        observer.onError(APIClientError.NoResponse)
                    }
                }

                task.resume()

                return Disposables.create {
                    task.cancel()
                }
            } catch let error {
                observer.onError(error)
            }

            return Disposables.create()
        }
    }
}

