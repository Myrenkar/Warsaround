//
//  MapViewController.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 28/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import CoreLocation
import HDAugmentedReality
import MapKit
import UIKit

internal final class MapViewController: UIViewController {
    var onButtonPressed: (() -> Void)?

    var mapView = MapView(frame: .zero)
    fileprivate let locationManager = CLLocationManager()
    fileprivate var startedLoadingPOIs = false
    fileprivate var places = [Place]()

    override func loadView() {
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addKeyAction(button: mapView.functionButton)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        zoom(toCurrentLocation: mapView.mapView.userLocation.coordinate)
    }

    private func addKeyAction(button: UIButton) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapChangeButton))
        button.addGestureRecognizer(tapGestureRecognizer)
    }

    dynamic func didTapChangeButton() {
        onButtonPressed?()
    }

    func zoom(toCurrentLocation location: CLLocationCoordinate2D) {
       mapView.mapView.setRegion(MKCoordinateRegionMake(location, MKCoordinateSpanMake(0.1, 0.1)), animated: true)
    }
}
