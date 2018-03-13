//
//  LaunchHelper.swift
//  Vision
//
//  Created by Utsav Patel on 13/03/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Foundation
import Cocoa
import ServiceManagement

fileprivate extension Notification.Name {
    static let killLauncher = Notification.Name("killLauncher")
}

class LaunchHelper {
    
    static let shared = LaunchHelper()
    
    private init() { }
    
    
    func startUp() {
        
        let launcherAppId = "com.erbittuu.VisionLauncher"
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = !runningApps.filter { $0.bundleIdentifier == launcherAppId }.isEmpty
        
        SMLoginItemSetEnabled(launcherAppId as CFString, true)
        
        if isRunning {
            DistributedNotificationCenter.default().post(name: .killLauncher,
                                                         object: Bundle.main.bundleIdentifier!)
        }
    }
}



