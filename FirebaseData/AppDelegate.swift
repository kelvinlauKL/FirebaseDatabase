//
//  AppDelegate.swift
//  FirebaseData
//
//  Created by Kelvin Lau on 2016-10-18.
//  Copyright © 2016 Kelvin Lau. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
final class AppDelegate: UIResponder {
  var window: UIWindow?
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    FIRApp.configure()
    return true
  }
}
