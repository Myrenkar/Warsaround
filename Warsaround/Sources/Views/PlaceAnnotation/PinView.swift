//
//  PinView.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 26/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit
import PureLayout

internal final class PinView: BaseView {

    lazy var stackView = UIStackView(frame: .zero)
    lazy var photoImageView = UIImageView(frame: .zero)
    lazy var titleLabel = UILabel(frame: .zero)

    override func setupHierarchy() {
        addSubview(stackView)
    }

    override func setupProperties() {
        stackView = UIStackView(axis: .horizontal, distribution: .fill, alignment: .fill, spacing: 4, arrangedSubviews: [photoImageView, titleLabel])
    }

    override func setupConstraints() {
        stackView.autoPinEdgesToSuperviewEdges()
    }

}
