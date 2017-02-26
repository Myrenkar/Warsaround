//
//  MapViewController.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 28/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

internal final class MapViewController: UIViewController {
    var onButtonPressed: (() -> Void)?

    lazy var mapView = MapView(frame: .zero)
    fileprivate var startedLoadingPOIs = false
    fileprivate var places = [Place]()

    override func loadView() {
        view = mapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addKeyAction(button: mapView.functionButton)
    }

    private func addKeyAction(button: UIButton) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapChangeButton))
        button.addGestureRecognizer(tapGestureRecognizer)
    }

    dynamic func didTapChangeButton() {
        onButtonPressed?()
    }
}
