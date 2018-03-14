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

    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    private override init() {   }
    
    override func awakeFromNib() {
        let icon = #imageLiteral(resourceName: "statusIcon")
        icon.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
    }
    
    @IBAction func enableDisableAction(_ sender: NSMenuItem) {
        let baseWindow = BaseWindow.instance()
        baseWindow.showWindow(nil)
    }
    
    @IBAction func quitAction(_ sender: NSMenuItem) {
        NSApp.terminate(nil)
    }
    
    @IBAction func tipsAction(_ sender: NSMenuItem) {
        
    }
}
