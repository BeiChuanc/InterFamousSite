//
//  WelcomeController.swift
//  InternetFamous
//
//  Created by 北川 on 2024/11/17.
//

import Foundation
import UIKit

class WelcomeController: ParentControllerManager {
    
    // Welcom bg
    var welcomeBg = UIImageView.init(image: UIImage(named: "wlcome_bg"))
    
    // Apple Login
    var appleLogin = UIButton(type: .custom)
    
    // Email Login
    var emailLogin = UIButton(type: .custom)
    
    // Visitor Login
    var visitorLogin = UIButton(type: .custom)
    
    // Button Groupe
    var btnStack = UIStackView.init()
    
    // Terms && Privacy
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setupUI() {
        
    }
    
    func setupButton() {
        appleLogin.tag = 0
        emailLogin.tag = 1
        visitorLogin.tag = 2
        appleLogin.addTarget(self, action: #selector(loginHandle(_:)), for: .touchUpInside)
        emailLogin.addTarget(self, action: #selector(loginHandle(_:)), for: .touchUpInside)
        visitorLogin.addTarget(self, action: #selector(loginHandle(_:)), for: .touchUpInside)
    }
    
}
