//
//  MapViewController.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 28/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

internal final class MapViewController: UIViewController {

    fileprivate var mapView = MapView(frame: .zero)

    override func loadView() {
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
