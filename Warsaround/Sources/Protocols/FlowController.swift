//
//  FlowController.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 29/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

/// Defines flow between view controllers
/// The main purpose of flow controllers is to keep view controller decoupled and separated
internal protocol FlowController {

    associatedtype ViewController

    /// The root view controller of current flow
    var rootViewController: ViewController { get }

}
