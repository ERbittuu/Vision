//
//  File.swift
//  Vision
//
//  Created by Utsav Patel on 14/03/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Foundation
import Cocoa

class AppController : NSObject {
    
    static let titleEnabled = "Enabled 😃"
    static let titleDisabled = "Disabled 😔"
    
    static let shared = AppController()

    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    private override init() {   }
    
    override func awakeFromNib() {
        let icon = #imageLiteral(resourceName: "statusIcon")
        icon.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        statusMenu.item(at: 0)!.title = Defaults[.startAtLogin] ? AppController.titleEnabled : AppController.titleDisabled
        statusMenu.delegate = self
    }
    
    @IBAction func enableDisableAction(_ sender: NSMenuItem) {
        
        let isEnabled = (sender.title == AppController.titleEnabled)
        
        Defaults[.startAtLogin] = !isEnabled
        LaunchHelper.shared.startUpChanges()
        sender.title = Defaults[.startAtLogin] ? AppController.titleEnabled : AppController.titleDisabled
    }

    var preferenceController : NSWindowController?
    @IBAction func preferenceAction(_ sender: NSMenuItem) {
        if preferenceController == nil {
            preferenceController = PreferenceController.selfObject
        }
        preferenceController?.showWindow(nil)
    }
    
    @IBAction func quitAction(_ sender: NSMenuItem) {
        NSApp.terminate(nil)
    }
    
    @IBAction func tipsAction(_ sender: NSMenuItem) {
        
    }
}

extension AppController : NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {
        statusMenu.item(at: 0)!.title = Defaults[.startAtLogin] ? AppController.titleEnabled : AppController.titleDisabled
    }
}

