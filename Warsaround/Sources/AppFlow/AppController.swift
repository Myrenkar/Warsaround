//
//  AppController.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 19/02/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

final class AppController {

    let rootFlowController = MapFlowController()

    func presentRootController(inWindow window: UIWindow) {
        set(window: window, withRootController: rootFlowController.rootViewController)
    }

    private func set(window: UIWindow, withRootController rootController: UIViewController) {
        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }
}
