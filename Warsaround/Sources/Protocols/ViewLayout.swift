//
//  ViewLayout.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 22/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//


import UIKit

/// Defines ViewLayout Protocol
protocol ViewLayout {

    /// View type to be arrange
    associatedtype View

    /// Defines ViewLayout method applicable to view
    ///
    /// - parameter view: view for arrange
    func apply(view: View)

}
