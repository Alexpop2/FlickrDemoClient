//
//  AppDelegate.swift
//  FlickrDemoClient
//
//  Created by Igor on 04/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var app: Application?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let app = Application()
        window?.rootViewController = app.loadRootVC()
        window?.makeKeyAndVisible()
        self.app = app
        return true
    }
}

