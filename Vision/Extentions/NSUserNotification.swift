//
//  NSUserNotification.swift
//  Vision
//
//  Created by Utsav Patel on 4/4/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Foundation
import Cocoa

extension NSUserNotification {
    enum Note {
        case start
        case end
        case startUpEnabled
        case startUpDisable(Bool)
        case custom(String, String)
        
        var stringValue : (String, String) {
            get {
                switch self {
                case .start :
                    return ("first Notification Fire", "App is started now")
                case .end :
                    return ("end Notification Fire", "App is stoped now")
                case .startUpEnabled :
                    return ("Run at startup is enabled", "")
                case .startUpDisable(let inform) :
                    return ("Run at startup is disabled", inform ? "start from preference" : "")
                case .custom(let message) :
                    return message
                    
                }
                
            }
        }
    }
    
    static func fire(type: Note) {
        let notificationCenterDefault = NSUserNotificationCenter.default
        notificationCenterDefault.delegate = Helper.shared
        
        // Clear Old Notifications
        notificationCenterDefault.removeAllDeliveredNotifications()
        
        // Create New
        let notification = NSUserNotification()
        notification.title = type.stringValue.0
        if type.stringValue.1.count > 0 {
            notification.informativeText = type.stringValue.1
        }
        
        if Defaults[.sound] {
            notification.soundName = NSUserNotificationDefaultSoundName
        }
        notificationCenterDefault.deliver(notification)
    }
}
