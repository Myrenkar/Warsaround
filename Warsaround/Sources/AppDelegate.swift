//
//  AppDelegate.swift
//  Warsaround
//
//  Created by Piotr Torczynski on 28/01/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let viewController = MapFlowController()
        guard let window  = window else {
            return false
        }
        window.rootViewController = viewController.rootViewController
        window.makeKeyAndVisible()
        return true
    }
}

