//
//  Utils.swift
//  flower
//
//  Created by 北川 on 2024/11/11.
//

import Foundation
import UIKit
import Photos
import AssetsLibrary
import MediaPlayer
import CoreTelephony
import CoreLocation
import AVFoundation

enum HWpermissionsType{
    
    case camera
    
    case photo
    
    case location
    
    case network
    
    case microphone
    
    case media
    
    case notification
}

class PessionUtil: NSObject {
    
    class func openEventServiceWithBolck(_ isSet: Bool? = nil, _ action: @escaping ((Bool) -> ())) {
        // 创建一个 CTCellularData 实例用于检测蜂窝数据状态
        let cellularData = CTCellularData()
        
        // 设置状态更新通知，当蜂窝数据的状态变化时触发
        cellularData.cellularDataRestrictionDidUpdateNotifier = { (state) in
            // 如果蜂窝数据状态为未知或未受限制，则认为蜂窝数据不可用
            if state == CTCellularDataRestrictedState.restrictedStateUnknown ||  state == CTCellularDataRestrictedState.notRestricted {
                action(false)
                if isSet == true { openURL(.network) }
            } else {
                action(true)
            }
        }
        
        // 获取当前的蜂窝数据状态
        let state = cellularData.restrictedState
        
        // 如果蜂窝数据状态为未知或未受限，认为蜂窝数据不可用
        if state == CTCellularDataRestrictedState.restrictedStateUnknown ||  state == CTCellularDataRestrictedState.notRestricted {
            action(false)
            if isSet == true { openURL(.network) }
        } else {
            action(true)
        }
    }
    
    class func openNotificationServiceWithBlock(_ isSet: Bool? = nil, _ action: @escaping ((Bool) -> ())) {
        // 获取当前通知设置的状态
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            // 判断通知权限是否已授权
            if settings.authorizationStatus == .authorized {
                action(true)
            } else {
                action(false)
                if isSet == true { openURL(.notification) }
            }
        }
    }
    
    class func openLocationServiceWithBlock(_ isSet: Bool? = nil, _ action: @escaping ((Bool) -> ())) {
        // 定义一个变量，用于判断定位服务是否开启
        var isOpen = false
        
        // 获取当前的定位权限状态，如果不是受限（restricted）或拒绝（denied），则认为权限是开放的
        if CLLocationManager().authorizationStatus != .restricted && CLLocationManager().authorizationStatus != .denied {
            isOpen = true
        }
        
        if isOpen == false && isSet == true {
            openURL(.location)
        }
        
        action(isOpen)
    }
    
    class func openCaptureDeviceServiceWithBlock(_ isSet: Bool? = nil, _ action: @escaping ((Bool) -> ())) {
        // 获取相机权限状态
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        
        // 如果权限状态为未确定 (即首次请求权限)
        if authStatus == AVAuthorizationStatus.notDetermined {
            // 请求相机权限
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { (granted) in
                action(granted)
            }
        } else if authStatus == AVAuthorizationStatus.restricted || authStatus == AVAuthorizationStatus.denied {
            action(false)
            if isSet == true { openURL(.camera) }
        } else {
            action(true)
        }
    }
    
    
    class func openAlbumServiceWithBlock(_ isSet: Bool? = nil, _ action: @escaping ((Bool) -> ())) {
        if #available(iOS 14, *) {
            // 请求相册权限
            PHPhotoLibrary.requestAuthorization { status in
                DispatchQueue.main.async {
                    // 初始化相册是否可用的标志
                    var isOpen = true
                    // 判断相册权限状态
                    if status == .restricted || status == .denied {
                        isOpen = false
                        if isSet == true {
                            openURL(.photo)
                        }
                    } else if status == .limited {
                        isOpen = true
                    }
                    action(isOpen)
                }
            }
        }
    }
    
    class func openRecordServiceWithBlock(_ isSet:Bool? = nil,_ action :@escaping ((Bool)->())) {
        // 获取麦克风权限状态
        let permissionStatus = AVAudioApplication.shared.recordPermission
        
        // 如果权限状态是未确定
        if permissionStatus == .undetermined {
            // 请求麦克风权限
            AVAudioApplication.requestRecordPermission { (granted) in
                action(granted)
            }
        } else if permissionStatus == .denied {
            action(false)
            if isSet == true { openURL(.microphone) }
        } else {
            action(true)
        }
    }
    
    class func openURL(_ type: HWpermissionsType? = nil) {
        var title = "Limited access"
        var message = "Please click 'settings' to allow access"
        let appName: String = (Bundle.main.infoDictionary!["CFBundleDisplayName"] ?? "") as! String
        
        if type == .camera {
            title = NSLocalizedString("delicacy_camera_authority_title", comment: "")
            message = NSLocalizedString("delicacy_camera_authority_msg", comment: "")
        } else if type == .photo {
            title = NSLocalizedString("delicacy_photo_authority_title", comment: "")
            message = NSLocalizedString("delicacy_photo_authority_msg", comment: "")
        } else if type == .location {
            title = NSLocalizedString("delicacy_location_authority_title", comment: "")
            message = NSLocalizedString("delicacy_location_authority_msg", comment: "")
        } else if type == .network {
            message = "请在iPhone的\"设置-蜂窝移动网络\"选项中，允许\"\(appName)\"访问您的移动网络"
        } else if type == .microphone {
            title = NSLocalizedString("delicacy_microphone_authority_title", comment: "")
            message = NSLocalizedString("delicacy_microphone_authority_msg", comment: "")
        } else if type == .media {
            
        } else if type == .notification {
            title = NSLocalizedString("", comment: "")
            message = NSLocalizedString("notification_authority_msg", comment: "")
        }
        
        let url = URL(string: UIApplication.openSettingsURLString)
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:NSLocalizedString("cancel", comment: ""), style: .cancel, handler:nil)
        
        let settingsAction = UIAlertAction(title:NSLocalizedString("Setting", comment: ""), style: .default, handler: {
            (action) -> Void in
            if  UIApplication.shared.canOpenURL(url!) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url!, options: [:],completionHandler: {(success) in})
                } else {
                    UIApplication.shared.openURL(url!)
                }
            }
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        UIViewController.currentViewController()?.present(alertController, animated: true, completion: nil)
        
        
    }
    
    class func OpenSysSet() {
        let url = URL(string: UIApplication.openSettingsURLString)
        let btns = [
            (title: NSLocalizedString("Go_to_Settings", comment: ""), style: UIAlertAction.Style.default, color: UIColor(named: " ConfigColor.COLOR_MAIN")),
            (title: NSLocalizedString("cancel", comment: ""), style: UIAlertAction.Style.cancel, color: UIColor(named: "#494949"))
        ]
        
        UIAlertController.showAlert(
            message: NSLocalizedString("Turn_Location_On_tips", comment: ""),
            title: NSLocalizedString("Turn_Location_On", comment: ""),
            btns: btns,
            parent: UIViewController.currentViewController(),
            preferredStyle: .actionSheet,
            backgroundColor: UIColor.white,
            titleStyle: (font: UIFont.systemFont(ofSize: 20), color: UIColor(named: "#494949")),
            messageStyle: (font: UIFont.systemFont(ofSize: 18), color: UIColor(named: "#494949"))
        ){ (btnTitle) in
            switch (btnTitle) {
            case NSLocalizedString("Go_to_Settings", comment: ""):
                if  UIApplication.shared.canOpenURL(url!) {
                    if #available(iOS 10, *) {
                        UIApplication.shared.open(url!, options: [:],completionHandler: {(success) in})
                    } else {
                        UIApplication.shared.openURL(url!)
                    }
                }
                break
            default:
                break
            }
        }
    }
}

