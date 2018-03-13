//
//  LaunchHelper.swift
//  VisionLauncher
//
//  Created by Utsav Patel on 13/03/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Foundation
import Cocoa

fileprivate extension Notification.Name {
    static let killLauncher = Notification.Name("killLauncher")
}

class LaunchHelper {
    
    static let shared = LaunchHelper()
    
    private init() { }
    
    func startUp() {
        let mainAppIdentifier = "com.erbittuu.Vision"
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = !runningApps.filter { $0.bundleIdentifier == mainAppIdentifier }.isEmpty
        
        if !isRunning {
            DistributedNotificationCenter.default().addObserver(self,
                                                                selector: #selector(self.terminate),
                                                                name: .killLauncher,
                                                                object: mainAppIdentifier)
            
            let path = Bundle.main.bundlePath as NSString
            var components = path.pathComponents
            components.removeLast()
            components.removeLast()
            components.removeLast()
            components.append("MacOS")
            components.append("Vision") //main app name
            
            let newPath = NSString.path(withComponents: components)
            
            NSWorkspace.shared.launchApplication(newPath)
        }
        else {
            self.terminate()
        }
    }
    
    @objc func terminate() {
        NSApp.terminate(nil)
    }
}
