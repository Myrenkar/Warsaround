//
//  PlacesProvider.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 28/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

//AIzaSyAeEZ2NRyzVmW8IbWcq4J38PheUKfRK-2w

import CoreLocation
import RxSwift

internal struct PlacesProvider {

    let apiClient: APIClient
    let placesArray = Variable<[Place]>([])

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func loadPOIS(location: CLLocation, radius: Int = 30) -> Observable<[Place]> {
        print("Load pois")
        let lattitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude

        let placesRequest = PlacesRequest(lattitude: lattitude, longitude: longitude, radius: radius)

        return apiClient
            .send(request: placesRequest)
            .flatMap { response -> Observable<[JSONValue]> in
                guard let data = response.data else { throw APIResponseError.MissingData }
                let jsonArray = try JSONValue(data: data).array()
                return Observable.just(jsonArray)
            }
            .flatMap { jsonArray -> Observable<[Place]> in
                let array = try jsonArray.map { try Place(json: $0) }
                return Observable.just(array)
            }
    }

//    func loadDetailInformation(forPlace: Place, handler: @escaping (NSDictionary?, NSError?) -> Void) {
//
//        let uri = apiURL + "details/json?reference=\(forPlace.reference)&sensor=true&key=\(apiKey)"
//
//        let url = URL(string: uri)!
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        let dataTask = session.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error)
//            } else if let httpResponse = response as? HTTPURLResponse {
//                if httpResponse.statusCode == 200 {
//                    print(data!)
//
//                    do {
//                        let responseObject = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
//                        guard let responseDict = responseObject as? NSDictionary else {
//                            return
//                        }
//                        
//                        handler(responseDict, nil)
//                        
//                    } catch let error as NSError {
//                        handler(nil, error)
//                    }
//                }
//            }
//        }
//        
//        dataTask.resume()
//    }

}
