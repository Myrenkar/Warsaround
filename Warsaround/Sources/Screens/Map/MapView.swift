//
//  MapView.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 28/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import MapKit
import PureLayout

final class MapView: BaseView {

    lazy var mapView = MKMapView(frame: .zero)
    lazy var functionButton = UIButton(frame: .zero)

    override func setupHierarchy() {
        addSubview(mapView)
        addSubview(functionButton)
    }

    override func setupConstraints() {
        let viewLayout = MapViewViewLayout()
        viewLayout.apply(view: self)
    }

    override func setupProperties() {
        let decorator = MapViewDecorator()
        decorator.decorate(withView: self)

        mapView.showsUserLocation = true
    }
}
