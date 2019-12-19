//
//  AppDelegate.swift
//
//  Created by apurva on 18/12/19.
//

import Firebase
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()

        // Window setup
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: LandingScreenViewController(nibName: "LandingScreenViewController", bundle: nil))
        window?.makeKeyAndVisible()
        return true
    }
  
  
}

