//
//  RBI.swift
//  InternetFamous
//
//  Created by 北川 on 2024/12/16.
//

import Foundation

/**
 
 Upload data to server, collect the user action.
 
 Data: JSON format.
 
 */

struct RBIJson {
    
    var userId: Int       // User
    
    var uuid: String      // UUID
    
    var scenario: Int     // View
    
    var uAction: String   // User action
    
    var preAction: String // Previous action
    
    var time: Int         // Action trigger time(East 0)
    
}

enum VIEWS: Int {
    
    case UNKNOWN = 0
    
    case WELCOME = 1
    
    case EMAIL = 2
    
    case REGISTER = 3
    
    case RETRIEVE = 4
    
    case INPUTMES = 5
    
}

enum CLICK: Int {
    
    case APPLE = 200
    
    case EMAIL = 201
    
    case GUEST = 202
    
    case REGISTER = 203
    
    case RETRIEVE = 204
    
    case SKIP = 205
    
}
