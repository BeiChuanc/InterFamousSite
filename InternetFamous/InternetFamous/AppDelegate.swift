//
//  AppDelegate.swift
//  InternetFamous
//
//  Created by 北川 on 2024/11/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        PageControllerManager.welcome(window!)
        
        return true
    }
    

}

