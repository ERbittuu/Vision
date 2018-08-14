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
    
    private var firstNotification = false
    
    private var breakTimer = false
    private var scheduled = false
    private var timeDelay = TimeInterval(10)
    private var timeBreak = TimeInterval(10)
    private var time: TimeInterval  {
        get {
            return timeDelay + timeBreak
        }
    }
    private var timer : Timer?

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
        NSUserNotification.fire(type: .end)
    }
    
    func notification() {
        print(#function)
        if firstNotification {
           firstNotification = false
            NSUserNotification.fire(type: .start)
        }else{
            NSUserNotification.fire(type: .custom("Test from Swift", "subtitle from Swift"))
        }
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
