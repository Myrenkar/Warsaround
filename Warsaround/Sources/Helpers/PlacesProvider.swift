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


    /// Initializes the instance
    ///
    /// - Parameter apiClient: API client to be used
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }


    /// Load POIs from remote service
    ///
    /// - Parameters:
    ///   - location: current user location
    ///   - radius: radius in metres for checking POIs
    /// - Returns: Observavle with array of places
    func loadPOIS(location: CLLocation, radius: Int = 30) -> Observable<[Place]> {
        let lattitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude

        let placesRequest = PlacesRequest(lattitude: lattitude, longitude: longitude, radius: radius)

        return apiClient
            .send(request: placesRequest)
            .flatMap { response -> Observable<[Place]> in
                guard let data = response.data else { throw APIResponseError.MissingData }
                let json = try JSONValue(data: data).dictionary()
                let jsonArray = try json["results"]!.array()
                let places = try jsonArray.map { try Place(json: $0) }
                return Observable.from(places)
            }
    }

    func loadDetailInformation(forPlace place: Place) -> Observable<PlaceDetails> {

        let placesDetailsRequest = PlaceDetailsRequest(withPlace: place)

        return apiClient
            .send(request: placesDetailsRequest)
            .flatMap { response -> Observable<PlaceDetails> in
                guard let data = response.data else { throw APIResponseError.MissingData }
                let json = try JSONValue(data: data).dictionary()
                let place = try PlaceDetails(deserializingFromJSONValue: json["results"]!)
                return Observable.from(place)
            }
    }

}
