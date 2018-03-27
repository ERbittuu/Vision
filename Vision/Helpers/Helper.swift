//
//  Helper.swift
//  Vision
//
//  Created by Utsav Patel on 14/03/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Foundation

typealias Closure = (() -> ())

class Helper :NSObject {
    
    static let shared = Helper()
    
    private var on : Bool {
        return Defaults[.running]
    }
    
    private var firstNotification = fals=-]{_'0;98 utr}
    
    private var breakTimer = false
    private var scheduled = false
    private var time = TimeInterval(10)
    private var timer : Timer?
    
    let notificationCenterDefault = NSUserNotificationCenter.default

    @discardableResult
    private override init() {
        super.init()
        when(.stateChange) { _ in
            if self.on {
                self.start()
            }else {
                self.invalidate()
            }
        }
        notificationCenterDefault.delegate = self
    }
    
    func start() {
        
        if on {
            if scheduled {
                print("Already On")
                return
            }
            
            firstNotification = true
            scheduled = true
            self.timer = Timer.runThisEvery(seconds: time, handler: { (timer) in
                if self.on {
                    self.notification()
                }else{
                    self.invalidate()
                }
            })
        }else {
            if scheduled {
                scheduled = false
            }
        }
    }
    
    func invalidate() {
        print(#function)
        scheduled = false
        timer?.invalidate()
        timer = nil
        endNotificationFire()
    }
    
    func notification() {
        print(#function)
        if firstNotification {
           firstNotification = false
            firstNotificationFire()
        }else{
            showNotification()
        }
    }
    
    func endNotificationFire() -> Void {
        // Clear Old Notifications
        notificationCenterDefault.removeAllDeliveredNotifications()
        
        // Create New
        let notification = NSUserNotification()
        notification.title = "end Notification Fire"
        notification.informativeText = "App is stoped now"
        notification.soundName = NSUserNotificationDefaultSoundName
        notificationCenterDefault.deliver(notification)
    }
    
    func firstNotificationFire() -> Void {
        // Clear Old Notifications
        notificationCenterDefault.removeAllDeliveredNotifications()
        
        // Create New
        let notification = NSUserNotification()
        notification.title = "first Notification Fire"
        notification.informativeText = "App is started now"
        notification.soundName = NSUserNotificationDefaultSoundName
        notificationCenterDefault.deliver(notification)
    }
    
    func showNotification() -> Void {
        // Clear Old Notifications
         notificationCenterDefault.removeAllDeliveredNotifications()
        
        // Create New
        let notification = NSUserNotification()
        notification.title = "Test from Swift"
        notification.subtitle = "subtitle from Swift"
        notification.hasActionButton  = true
        notification.actionButtonTitle = "Break time"
        notification.informativeText = "\(Date())"
        notification.soundName = NSUserNotificationDefaultSoundName
        notificationCenterDefault.deliver(notification)
    }
    
    func note4informThatDisabled() -> Void {
        // Clear Old Notifications
        notificationCenterDefault.removeAllDeliveredNotifications()
        
        // Create New
        let notification = NSUserNotification()
        notification.title = "Run at startup is disabled"
        notification.informativeText = "start from preference"
        notification.soundName = NSUserNotificationDefaultSoundName
        notificationCenterDefault.deliver(notification)
    }
    
    func startupSet2Disabled() -> Void {
        // Clear Old Notifications
        notificationCenterDefault.removeAllDeliveredNotifications()
        
        // Create New
        let notification = NSUserNotification()
        notification.title = "Run at startup is disabled"
        notification.soundName = NSUserNotificationDefaultSoundName
        notificationCenterDefault.deliver(notification)
    }
    
    func startupSet2Enabled() -> Void {
        // Clear Old Notifications
        notificationCenterDefault.removeAllDeliveredNotifications()
        
        // Create New
        let notification = NSUserNotification()
        notification.title = "Run at startup is enabled"
        notification.soundName = NSUserNotificationDefaultSoundName
        notificationCenterDefault.deliver(notification)
    }
}

extension Helper : NSUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, didActivate notification: NSUserNotification) {
        if notification.activationType == .contentsClicked {
            
        }
        
        if notification.activationType == .actionButtonClicked {
            
        }
    }
}
