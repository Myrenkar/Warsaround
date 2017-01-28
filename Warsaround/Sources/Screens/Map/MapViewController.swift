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

    fileprivate var mapView = MapView(frame: .zero)
    fileprivate let locationManager = CLLocationManager()
    fileprivate var startedLoadingPOIs = false
    fileprivate var places = [Place]()

    fileprivate var arViewController: ARViewController!

    override func loadView() {
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configure(withManager: self.locationManager)

        self.addKeyAction(button: mapView.functionButton)
    }

    private func configure(withManager manager: CLLocationManager) {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.startUpdatingLocation()
        manager.requestWhenInUseAuthorization()
    }

    private func addKeyAction(button: UIButton) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapChangeButton))
        button.addGestureRecognizer(tapGestureRecognizer)
    }

    dynamic func didTapChangeButton() {
        arViewController = ARViewController()
        arViewController.dataSource = self
        arViewController.maxVisibleAnnotations = 30
        arViewController.headingSmoothingFactor = 0.05
        arViewController.setAnnotations(places)
        self.present(arViewController, animated: true, completion: nil)

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

            if !startedLoadingPOIs {
                startedLoadingPOIs = true
                let loader = PlacesProvider()

                loader.loadPOIS(location: location, radius: 1000) { placesDict, error in
                    if let dict = placesDict {
                        guard let placesArray = dict.object(forKey: "results") as? [NSDictionary]  else { return }
                        for placeDict in placesArray {
                            let latitude = placeDict.value(forKeyPath: "geometry.location.lat") as! CLLocationDegrees
                            let longitude = placeDict.value(forKeyPath: "geometry.location.lng") as! CLLocationDegrees
                            let reference = placeDict.object(forKey: "reference") as! String
                            let name = placeDict.object(forKey: "name") as! String
                            let address = placeDict.object(forKey: "vicinity") as! String

                            let location = CLLocation(latitude: latitude, longitude: longitude)
                            let place = Place(location: location, reference: reference, name: name, address: address)
                            self.places.append(place)
                            let annotation = PlaceAnnotation(location: place.location!.coordinate, title: place.placeName)
                            DispatchQueue.main.async {
                                self.mapView.mapView.addAnnotation(annotation)
                            }
                        }
                    }
                }
            }
        }
        
    }
}

extension MapViewController: ARDataSource {
    func ar(_ arViewController: ARViewController, viewForAnnotation: ARAnnotation) -> ARAnnotationView {
        let annotationView = AnnotationView()
        annotationView.annotation = viewForAnnotation
        annotationView.delegate = self
        annotationView.frame = CGRect(x: 0, y: 0, width: 150, height: 50)

        return annotationView
    }
}

extension MapViewController: AnnotationViewDelegate {
    func didTouch(annotationView: AnnotationView) {
        print("Tapped view for POI: \(annotationView.titleLabel?.text)")
    }
}
