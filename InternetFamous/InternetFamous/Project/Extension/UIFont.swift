//
//  UIFont.swift
//  InternetFamous
//
//  Created by 北川 on 2024/12/10.
//

import Foundation
import UIKit

extension UIFont {
    
    // Custom Define Font
    func setFont(fontName: String, sizeFont: CGFloat) -> UIFont {
        return UIFont(name: fontName, size: CGFloat(sizeFont))!
    }
    
}
