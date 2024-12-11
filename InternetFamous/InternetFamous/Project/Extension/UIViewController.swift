//
//  UIViewController.swift
//  flower
//
//  Created by 北川 on 2024/11/13.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func currentViewController(baseView: UIViewController? = nil) -> UIViewController? {
        let baseViewController = baseView ?? UIApplication.shared.keyWindow?.rootViewController
        
        if let UINav = baseViewController as? UINavigationController {
            return currentViewController(baseView: UINav.visibleViewController)
        } else if let UITab = baseViewController as? UITabBarController {
            return currentViewController(baseView: UITab.selectedViewController)
        } else if let preVC = baseViewController?.presentedViewController {
            return currentViewController(baseView: preVC)
        }
        return baseViewController
    }
    
    class func isPresented(viewControllerToFind: UIViewController) -> Bool {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            var presentedVC = rootVC.presentedViewController
            while presentedVC != nil {
                if type(of: presentedVC!) == type(of: viewControllerToFind)  {
                    return true
                }
                presentedVC = presentedVC?.presentedViewController
            }
        }
        return false
    }
    
}
