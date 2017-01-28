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
        mapView.autoPinEdgesToSuperviewEdges()
        functionButton.autoSetDimensions(to: CGSize(width: 64, height: 32))
        functionButton.autoPinEdge(.right, to: .right, of: mapView, withOffset: -16)
        functionButton.autoPinEdge(.bottom, to: .bottom, of: mapView, withOffset: -16)
    }

    override func setupProperties() {
        functionButton.setTitle("Change", for: .normal)
        functionButton.setTitleColor(.red, for: .normal)
    }
}
