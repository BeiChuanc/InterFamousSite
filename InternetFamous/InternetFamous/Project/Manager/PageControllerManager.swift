//
//  PageControllerManager.swift
//  InternetFamous
//
//  Created by 北川 on 2024/11/17.
//

import Foundation
import UIKit

class PageControllerManager: NSObject {
    
    // Welcome
    class func welcome(_ window: UIWindow) {
        var viewC = UIViewController.currentViewController() as? WelcomeController
        viewC = WelcomeController()
        let navigationController = UINavigationController(rootViewController: viewC!)
        window.rootViewController = navigationController
    }
    
}
