//
//  ParentControllerManager.swift
//  InternetFamous
//
//  Created by 北川 on 2024/11/17.
//

import Foundation
import UIKit
import AuthenticationServices

enum link: String {
    
    case link1 // terms of use
    
    case link2 // privacy policy
    
}

class ParentControllerManager: UIViewController {
    
    var linkTextView = UITextView.init()  // Terms && Privacy
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
    }
    
    func setupTextView() {
        let terms = NSLocalizedString(link.link1.rawValue, comment: "")
        let privacy = NSLocalizedString(link.link2.rawValue, comment: "")
        let linkText = String(format: NSLocalizedString("loginLinkText", comment: ""), terms, privacy)
        let rangeTerms = NSMakeRange(linkText.strDistence(str: terms), terms.count)
        let rangePricy = NSMakeRange(linkText.strDistence(str: privacy), privacy.count)
        let attributeString = NSMutableAttributedString(string: linkText)
        attributeString.addAttribute(.link, value: "\(link.link1.rawValue)", range: rangeTerms)
        attributeString.addAttribute(.link, value: "\(link.link2.rawValue)", range: rangePricy)
        linkTextView.font = UIFont().with(fontName: "PingFangSC-Regular", sizeFont: 14)
        linkTextView.attributedText = attributeString
        linkTextView.textColor = UIColor.white
        linkTextView.tintColor = UIColor(hexstring: "#D1866F")
        linkTextView.backgroundColor = .clear
        linkTextView.textAlignment = .center
        linkTextView.delegate = self
    }
    
    // Login App: handle the token data to login.
    func loginWithApp(type: LoginType) {
        
    }
    
    @objc func loginHandle(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            loginWithApp(type: .APPLE)
            break
        case 1:
            loginWithApp(type: .EMAIL)
            break
        case 2:
            loginWithApp(type: .GUEST)
            break
        default:
            break
        }
    }
    
}

// Terms && Privacy: Link Click
extension ParentControllerManager: UITextViewDelegate {
    
    func textView(_ textView: UITextView, primaryActionFor textItem: UITextItem, defaultAction: UIAction) -> UIAction? {
        
        if case .link(let url) = textItem.content {
            PageControllerManager.termsPrivacy()
        }
        
        return nil
    }
    
}

// Navigation
extension ParentControllerManager {
    
    func navigationTop(title: String, letfBtn: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) // backgroud transparent
        navigationController?.navigationBar.shadowImage = UIImage()                      // remove underline
        
        let UINavigationBarAppearance = UINavigationBarAppearance()
        UINavigationBarAppearance.titleTextAttributes = [.foregroundColor : UIColor(hexstring: "#3B3B3B"), .font : UIFont(name: "Arial-BoldMT", size: 16.0)!]
        UINavigationBarAppearance.backgroundColor = UIColor(hexstring: "#000000")
        navigationController?.navigationBar.standardAppearance = UINavigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = nil
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.title = title
        
        if letfBtn {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btnBack")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(viewPrivous))
        }
        
    }
    
    @objc func viewPrivous() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func viewDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}


// AppleLogin Delegate
extension ParentControllerManager: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        switch authorization.credential {
//            
//        case let appleIDCredential as ASAuthorizationAppleIDCredential:
//            
//            let user = appleIDCredential.user
//            let funllName = appleIDCredential.fullName
//            let email = appleIDCredential.email
//            let authorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
//            let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)!
//            let state = appleIDCredential.state
//            let authorizedScopes  = appleIDCredential.authorizedScopes
//            let relUserStatus = appleIDCredential.realUserStatus
//            
////            Baking_LoginViewModel.shared.Baking_getUserAua(IDToken: identityToken) { [self] result in
////                guard let data = result as? [String : Any] else {
////                    let viewControl = CookSkipViewController()
////                    viewControl.Baking_IDToken = identityToken
////                    viewControl.Baking_Name = funllName?.nickname ?? ""
////                    navigationController?.pushViewController(viewControl, animated: true)
////                    return }
////                
////                let user = data["uid"] as? Int ?? 0
////                let userPassword = data["password"] as? String ?? ""
////                
////                Baking_LoginViewModel.shared.Baking_login(userName: "\(user)", userPwd: userPassword, isGuest: true, successCallBack: Baking_successCallBack, failCallBack: Baking_failCallBack)
////            }
//            
//            break
//        case let userCredential as ASPasswordCredential:
//            let user = userCredential.user
//            let password = userCredential.password
//            break
//        default:
//            
//            break
//        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if let e = error as? ASAuthorizationError {
            switch e.code {
            case .unknown:
                print("授权未知错误")
            case .canceled:
                print("授权取消")
            case .invalidResponse:
                print("授权无效请求")
            case .notHandled:
                print("授权未能处理")
            case .failed:
                print("授权失败")
            case .notInteractive:
                print("授权非交互式")
            @unknown default:
                print("授权其他原因")
            }
        }
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
}
