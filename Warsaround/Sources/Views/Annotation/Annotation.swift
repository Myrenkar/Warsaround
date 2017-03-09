//
//  Annotation.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 28/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import HDAugmentedReality
import UIKit
import PureLayout

protocol AnnotationViewDelegate {
    func didTouch(annotationView: AnnotationView)
}

final class AnnotationView: ARAnnotationView {
    lazy var photoImageView = UIImageView(frame: .zero)
    lazy var titleLabel = UILabel(frame: .zero)
    lazy var distanceLabel = UILabel(frame: .zero)
    lazy var phoneNuberLabel = UILabel(frame: .zero)
    lazy var topStackView = UIStackView(frame: .zero)
    lazy var labelsStackView = UIStackView(frame: .zero)

    var placeDetails: PlaceDetails?

    var delegate: AnnotationViewDelegate?

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        setupProperties()
        setupHierarchy()
        setupConstraints()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.didTouch(annotationView: self)
    }
}

extension AnnotationView {
    internal func setupProperties() {
        topStackView = UIStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .center, spacing: 4, arrangedSubviews: [photoImageView, titleLabel])
        labelsStackView = UIStackView.init(axis: .vertical, distribution: .equalSpacing, alignment: .center, spacing: 8, arrangedSubviews: [topStackView, distanceLabel, phoneNuberLabel])

        distanceLabel.backgroundColor = UIColor(white: 0.3, alpha: 0.7)
        distanceLabel.textColor  = .white
        if let annotation = annotation {
            distanceLabel.text =  String(format: "%.2f km", annotation.distanceFromUser / 1000)
        }

        titleLabel.backgroundColor = UIColor(white: 0.3, alpha: 0.7)
        titleLabel.textColor = .red
        titleLabel.text = annotation?.description

        phoneNuberLabel.backgroundColor = UIColor(white: 0.3, alpha: 0.7)
        phoneNuberLabel.textColor = .blue
        phoneNuberLabel.text = placeDetails?.phoneNumber

        photoImageView.setContentHuggingPriority(UILayoutPriorityDefaultLow, for: .horizontal)
        photoImageView.setContentHuggingPriority(UILayoutPriorityDefaultLow, for: .vertical)
    }


    internal func setupHierarchy() {
        addSubview(topStackView)
        addSubview(labelsStackView)
    }


    internal func setupConstraints() {
        labelsStackView.autoPinEdgesToSuperviewEdges()
    }
}
