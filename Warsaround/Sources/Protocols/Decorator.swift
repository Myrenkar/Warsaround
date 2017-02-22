//
//  Decorator.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 22/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

/// Implements Decorator pattern to views
internal protocol Decorator {
    associatedtype View

    /// Decorates the view
    ///
    /// - Parameter withView: view to be decorated
    func decorate(withView view: View)
}
