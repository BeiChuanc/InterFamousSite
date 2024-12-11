//
//  UIAlertController.swift
//  flower
//
//  Created by 北川 on 2024/11/13.
//

import Foundation
import UIKit

extension UIAlertController {
    
    class func showAlert(
        message: String?,
        title: String? = nil,
        btns: [(title: String, style: UIAlertAction.Style, color: UIColor?)] = [(title: "OK", style: UIAlertAction.Style.default, color: nil)],
        parent: UIViewController? = nil,
        preferredStyle: Style = .alert,
        backgroundColor: UIColor? = nil,
        titleStyle: (font: UIFont?, color: UIColor?)? = nil,
        messageStyle: (font: UIFont?, color: UIColor?)? = nil,
        closeHandler: ((_ btnTitle: String) -> ())? = nil
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        if backgroundColor != nil {
            if let firstSubview = alertController.view.subviews.first, let alertContentView = firstSubview.subviews.first {
                for view in alertContentView.subviews {
                    view.backgroundColor = backgroundColor
                }
            }
        }
        
        if title != nil && titleStyle != nil {
            var titleAttrs: [NSAttributedString.Key: Any] = [:]
            if titleStyle!.font != nil {
                titleAttrs[NSAttributedString.Key.font] = titleStyle!.font
            }
            if titleStyle!.color != nil {
                titleAttrs[NSAttributedString.Key.foregroundColor] = titleStyle!.color
            }
            
            let titleAttribute = NSMutableAttributedString(string: title!)
            titleAttribute.addAttributes(titleAttrs, range:NSMakeRange(0, title!.count))
            alertController.setValue(titleAttribute, forKey: "attributedTitle")
        }

        if message != nil && messageStyle != nil {
            var messageAttrs: [NSAttributedString.Key: Any] = [:]
            if messageStyle!.font != nil {
                messageAttrs[NSAttributedString.Key.font] = messageStyle!.font
            }
            if messageStyle!.color != nil {
                messageAttrs[NSAttributedString.Key.foregroundColor] = messageStyle!.color
            }
            
            let messageAttribute = NSMutableAttributedString.init(string: message!)
            messageAttribute.addAttributes(messageAttrs, range:NSMakeRange(0, message!.count))
            alertController.setValue(messageAttribute, forKey: "attributedMessage")
        }

        for btn in btns {
            let alertAction = UIAlertAction(title: btn.title, style: btn.style, handler: {
                action in
                closeHandler?(btn.title)
            })
            if btn.color != nil {
                alertAction.setValue(btn.color!, forKey: "titleTextColor")
            }
            alertController.addAction(alertAction)
        }
        
        let parent = parent == nil ? UIViewController.currentViewController() : parent
        parent?.present(alertController, animated: true, completion: nil)
    }

}
