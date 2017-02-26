//
//  UIStackView.swift
//
//

import UIKit

extension UIStackView {
    
    convenience init(axis: UILayoutConstraintAxis, distribution: UIStackViewDistribution = .fill, alignment: UIStackViewAlignment = .fill, spacing: Double = 0, arrangedSubviews: [UIView]) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = CGFloat(spacing)
    }
    
}
