//
//  AppDelegate.swift
//  TimeLineView
//
//  Created by hoangnc on 16/10/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "ViewController")
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        return true
    }

    
}
