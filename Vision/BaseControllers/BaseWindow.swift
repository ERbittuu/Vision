//
//  BaseWindow.swift
//  Vision
//
//  Created by Utsav Patel on 14/03/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Cocoa

class BaseWindow: NSWindowController {

    static func instance() -> BaseWindow {
        let `id` = "BaseWindow"
        return NSStoryboard.mainBoard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: id)) as! BaseWindow
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        if let mainScreen = NSScreen.main,
            let window = window {
            
            let widthBy3 = mainScreen.frame.width / 3
            let heightBy3 = mainScreen.frame.height / 3
            let heightBy2 = mainScreen.frame.height / 2

            let frame = NSRect(x: widthBy3, y: heightBy2, width: widthBy3, height: heightBy3)
            window.setFrame(frame, display: true)
            window.level = NSWindow.Level.statusBar
        }
    }
}
