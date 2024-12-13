//
//  LoginModel.swift
//  InternetFamous
//
//  Created by 北川 on 2024/12/13.
//

import Foundation

// Server Communications
class LoginModel {
    
    // First Login Time
    var firstLoginTime: Double = 0
    
    // UserId
    var userId: Int = 0
    
    // UserToken
    var userToken: String = ""
    
}

// Login Type
enum LoginType: Int {
    
    case APPLE = 0
    
    case EMAIL
    
    case GUEST
    
}

