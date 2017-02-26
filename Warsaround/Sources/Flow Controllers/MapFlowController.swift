//
//  MapFlowController.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 29/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation
import HDAugmentedReality
import MapKit
import RxSwift
import UIKit

internal class MapFlowController: NSObject, FlowController {
    typealias ViewController = UINavigationController

    /// The root view controller of current flow
    var rootViewController: UINavigationController

    fileprivate var places = [Place]()
    fileprivate var startedLoadingPOIs = false

    fileprivate let locationManager = CLLocationManager()
    fileprivate let apiClient: APIClient
    fileprivate let mapViewController: MapViewController
    fileprivate let augmentedRealityViewController: ARViewController
    fileprivate let placesProvider: PlacesProvider
    fileprivate let disposeBag = DisposeBag()

    /// Initializes MapFlowController
    ///
    /// - Parameter apiClient: apiClient to be used.
    init(apiClient: APIClient) {
        let navigationController = UINavigationController()
        rootViewController = navigationController

        self.apiClient = apiClient
        self.placesProvider = PlacesProvider(apiClient: apiClient)
        self.augmentedRealityViewController = ARViewController()
        self.mapViewController = MapViewController()

        super.init()

        self.mapViewController.onButtonPressed = {
            self.augmentedRealityViewController.setAnnotations(self.places)
            self.rootViewController.present(self.augmentedRealityViewController, animated: true, completion: nil)
        }

        configure(withARViewController: augmentedRealityViewController)
        configure(withManager: self.locationManager)

        navigationController.setViewControllers([mapViewController], animated: false)
    }
}

//MARK: Configuration methos
extension MapFlowController {
    fileprivate func configure(withARViewController controller: ARViewController) {
        controller.maxVisibleAnnotations = 30
        controller.headingSmoothingFactor = 0.05
        controller.definesPresentationContext = true
        controller.dataSource = self
    }

    fileprivate func configure(withManager manager: CLLocationManager) {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.startUpdatingLocation()
        manager.requestWhenInUseAuthorization()
    }

    fileprivate func setupMapView(withPlaces placesToLook: [Place]?) {
        guard let placesToLook = placesToLook else { return }
        for place in placesToLook {
            guard let location = place.geometry?.location else { return }

            places.append(place)
            let annotataion = PlaceAnnotation(location: location, title: place.description)
            DispatchQueue.main.async {
                self.mapViewController.mapView.mapView.addAnnotation(annotataion)
            }
        }
    }
}

//MARK: Functionality methos
extension MapFlowController {
    func showInfoView(forPlace place: Place) {
        let alert = UIAlertController(title: place.placeName , message: place.infoText, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.augmentedRealityViewController.present(alert, animated: true, completion: nil)
    }
}

//MARK: CLLocationManagerDelegate
extension MapFlowController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        if location.horizontalAccuracy < 100 {
            manager.stopUpdatingLocation()
            zoom(toCurrentLocation: location.coordinate)
            if !startedLoadingPOIs {
                startedLoadingPOIs = true
                placesProvider
                    .loadPOIS(location: location)
                    .observeOn(MainScheduler.instance)
                    .subscribe({ [unowned self] placesArray in
                        self.setupMapView(withPlaces: placesArray.element)
                    })
                    .addDisposableTo(disposeBag)
            }
        }
    }

    fileprivate func zoom(toCurrentLocation location: CLLocationCoordinate2D) {
        self.mapViewController.mapView.mapView.setRegion(MKCoordinateRegionMake(location, MKCoordinateSpanMake(0.005, 0.005)), animated: true)
    }
}

//MARK: ARDataSource
extension MapFlowController: ARDataSource {
    func ar(_ arViewController: ARViewController, viewForAnnotation: ARAnnotation) -> ARAnnotationView {
        let annotationView = AnnotationView()
        
        if let placeAnnotation =  viewForAnnotation as? Place {
            annotationView.annotation = placeAnnotation
            annotationView.delegate = self
            annotationView.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        }

        return annotationView
    }
}

//MARK: AnnotationViewDelegate
extension MapFlowController: AnnotationViewDelegate {
    func didTouch(annotationView: AnnotationView) {
        if let annotation = annotationView.annotation as? Place {
            placesProvider
                .loadDetailInformation(forPlace: annotation)
                .observeOn(MainScheduler.instance)
                .subscribe({[unowned self] place in
                    annotation.phoneNumber = place.element?.phoneNumber
                    annotation.website = place.element?.website
                    self.showInfoView(forPlace: annotation)
                })
                .addDisposableTo(disposeBag)
        }
    }
}
