//
//  MapViewViewLayout.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 22/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

internal final class MapViewViewLayout: ViewLayout {
    typealias View = MapView

    func apply(view: MapView) {
        view.mapView.autoPinEdgesToSuperviewEdges()
        view.functionButton.autoSetDimensions(to: CGSize(width: 64, height: 32))
        view.functionButton.autoPinEdge(.right, to: .right, of: view.mapView, withOffset: -16)
        view.functionButton.autoPinEdge(.bottom, to: .bottom, of: view.mapView, withOffset: -16)
    }
}

