//
//  MapViewDecorator.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 22/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

internal final class MapViewDecorator: Decorator {

    typealias View = MapView

    func decorate(withView view: MapView) {
        view.functionButton.setTitle("Change", for: .normal)
        view.functionButton.setTitleColor(.red, for: .normal)
    }
}
