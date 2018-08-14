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
    
    static let shared = AppController()
    private override init() {   }
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    override func awakeFromNib() {
        let icon = #imageLiteral(resourceName: "statusIcon")
        icon.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        statusMenu.delegate = self
        
        self.statusMenu.item(withTag: NSMenu.Tag.onOff.rawValue)?.title = NSMenu.Tag.onOff.title
        
        self.statusMenu.items[3].submenu!.item(withTag: NSMenu.Tag.sound.rawValue)?.title = NSMenu.Tag.sound.title
        self.statusMenu.items[3].submenu!.item(withTag: NSMenu.Tag.autoStart.rawValue)?.title = NSMenu.Tag.autoStart.title
        
        self.statusMenu.items[3].submenu!.item(withTag: NSMenu.Tag.sound.rawValue)?.state = NSMenu.Tag.sound.state
        self.statusMenu.items[3].submenu!.item(withTag: NSMenu.Tag.autoStart.rawValue)?.state = NSMenu.Tag.autoStart.state
    }
    
    @IBAction func enableDisableAction(_ sender: NSMenuItem) {
        
        let isEnabled = (sender.title == NSMenu.Tag.onOff.onTitle)
        
        Defaults[.running] = !isEnabled
        sender.title = NSMenu.Tag.onOff.title
        trigger(.stateChange)
    }
    
    @IBAction func quitAction(_ sender: NSMenuItem) {
        NSUserNotificationCenter.default.removeAllDeliveredNotifications()
        NSApp.terminate(nil)
    }
    
    @IBAction func tipsAction(_ sender: NSMenuItem) {
        
    }
    
    @IBAction func soundChanges(_ sender: NSMenuItem) {
        print(sender)
        let isEnabled = (sender.title == NSMenu.Tag.sound.onTitle)
        Defaults[.sound] = !isEnabled
        sender.title = NSMenu.Tag.sound.title
        sender.state = NSMenu.Tag.sound.state
    }
    
    @IBAction func autoStart(_ sender: NSMenuItem) {
        let isEnabled = (sender.title == NSMenu.Tag.autoStart.onTitle)
        Defaults[.autoStart] = !isEnabled
        sender.title = NSMenu.Tag.autoStart.title
        sender.state = NSMenu.Tag.autoStart.state
    }
}

extension AppController :  NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {    }
}
