//
//  WelcomeController.swift
//  InternetFamous
//
//  Created by 北川 on 2024/11/17.
//

import Foundation
import UIKit
import SnapKit

class WelcomeController: ParentControllerManager {
    
    var welcomeBg = UIImageView.init(image: UIImage(named: "wlcome_bg")) // Welcom bg
    
    var appleLogin = UIButton(type: .custom)                             // Apple Login
    
    var emailLogin = UIButton(type: .custom)                             // Email Login
    
    var visitorLogin = UIButton(type: .custom)                           // Visitor Login
    
    var btnStack = UIStackView.init()                                    // Button Groupe
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        appleLogin.layer.cornerRadius = appleLogin.frame.height / 2
        appleLogin.layer.masksToBounds = true
        emailLogin.layer.cornerRadius = emailLogin.frame.height / 2
        emailLogin.layer.masksToBounds = true
        visitorLogin.layer.cornerRadius = visitorLogin.frame.height / 2
        visitorLogin.layer.masksToBounds = true
    }
    
    func setupUI() {
        
        appleLogin.tag = 0
        emailLogin.tag = 1
        visitorLogin.tag = 2
        
        appleLogin.addTarget(self, action: #selector(loginHandle(_:)), for: .touchUpInside)
        emailLogin.addTarget(self, action: #selector(loginHandle(_:)), for: .touchUpInside)
        visitorLogin.addTarget(self, action: #selector(loginHandle(_:)), for: .touchUpInside)
        
        appleLogin.setTitle(NSLocalizedString("loginWithApple", comment: ""), for: .normal)
        emailLogin.setTitle(NSLocalizedString("loginWithemail", comment: ""), for: .normal)
        visitorLogin.setTitle(NSLocalizedString("loginWithVisitor", comment: ""), for: .normal)
        appleLogin.layer.borderWidth = 1
        appleLogin.layer.borderColor = UIColor.white.cgColor
        emailLogin.layer.borderWidth = 1
        emailLogin.layer.borderColor = UIColor.white.cgColor
        visitorLogin.layer.borderWidth = 1
        visitorLogin.layer.borderColor = UIColor.white.cgColor
        
        btnStack.addArrangedSubview(appleLogin)
        btnStack.addArrangedSubview(emailLogin)
        btnStack.addArrangedSubview(visitorLogin)
        btnStack.spacing = 20.0
        btnStack.axis = .vertical
        btnStack.distribution = .equalSpacing
        
        welcomeBg.contentMode = .scaleAspectFill
        
        view.addSubview(welcomeBg)
        view.addSubview(btnStack)
        view.addSubview(linkTextView)
        
        welcomeBg.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        linkTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-43)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(90)
        }
        
        btnStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(linkTextView.snp.top).offset(-90)
            make.leading.equalToSuperview().offset(40)
        }
        
        appleLogin.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        emailLogin.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        visitorLogin.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    @objc func term() {
        PageControllerManager.termsPrivacy()
    }
}
