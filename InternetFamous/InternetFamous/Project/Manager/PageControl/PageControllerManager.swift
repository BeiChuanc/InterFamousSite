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
    
    
    class func termsPrivacy() {
        // URL parttern
//        if let url = Bundle.main.url(forResource: "TermsPrivacy", withExtension: "html") {
//            UIApplication.shared.open(url, completionHandler: { (success) in
//                if success {
//                    print("成功打开隐私条例页面")
//                } else {
//                    print("打开隐私条例页面失败")
//                }
//            })
//        }
        
        // WebView parttern
        let viewControl = TermsPrivacy()
        viewControl.htmlFileName = "TermsPrivacy"
        viewControl.modalTransitionStyle = .coverVertical
        viewControl.modalPresentationStyle = .fullScreen
        UIViewController.currentViewController()?.navigationController?.present(viewControl, animated: true)
        
    }
    
}
