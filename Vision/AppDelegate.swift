//
//  AppDelegate.swift
//  Vision
//
//  Created by Utsav Patel on 13/03/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        LaunchHelper.shared.startUpChanges()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

