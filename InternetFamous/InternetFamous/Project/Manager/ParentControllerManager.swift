//
//  ParentControllerManager.swift
//  InternetFamous
//
//  Created by 北川 on 2024/11/17.
//

import Foundation
import UIKit
import AuthenticationServices

class ParentControllerManager: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Terms && Privacy
    var linkTextView = UITextView.init()
    
    // Login App: handle the token data to login.
    func login() {
        
    }
    
    @objc func loginHandle(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        default:
            break
        }
    }
    
}

// Terms && Privacy: Link Click
extension ParentControllerManager {
    
}


// AppleLogin Delegate
extension ParentControllerManager: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            let user = appleIDCredential.user
            let funllName = appleIDCredential.fullName
            let email = appleIDCredential.email
            let authorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
            let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)!
            let state = appleIDCredential.state
            let authorizedScopes  = appleIDCredential.authorizedScopes
            let relUserStatus = appleIDCredential.realUserStatus
            
//            Baking_LoginViewModel.shared.Baking_getUserAua(IDToken: identityToken) { [self] result in
//                guard let data = result as? [String : Any] else {
//                    let viewControl = CookSkipViewController()
//                    viewControl.Baking_IDToken = identityToken
//                    viewControl.Baking_Name = funllName?.nickname ?? ""
//                    navigationController?.pushViewController(viewControl, animated: true)
//                    return }
//                
//                let user = data["uid"] as? Int ?? 0
//                let userPassword = data["password"] as? String ?? ""
//                
//                Baking_LoginViewModel.shared.Baking_login(userName: "\(user)", userPwd: userPassword, isGuest: true, successCallBack: Baking_successCallBack, failCallBack: Baking_failCallBack)
//            }
            
            break
        case let userCredential as ASPasswordCredential:
            let user = userCredential.user
            let password = userCredential.password
            break
        default:
            
            break
        }
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
