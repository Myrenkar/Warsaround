//
//  MapViewController.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 28/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

internal final class MapViewController: UIViewController {

    fileprivate var mapView = MapView(frame: .zero)
    fileprivate let locationManager = CLLocationManager()

    override func loadView() {
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configure(withManager: self.locationManager)
    }

    private func configure(withManager manager: CLLocationManager) {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.startUpdatingLocation()
        manager.requestWhenInUseAuthorization()
    }
}

extension MapViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("Accuracy: \(location.horizontalAccuracy)")

        if location.horizontalAccuracy < 100 {
            manager.stopUpdatingLocation()
            let span = MKCoordinateSpan(latitudeDelta: 0.014, longitudeDelta: 0.014)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.mapView.region = region
        }

    }
}
