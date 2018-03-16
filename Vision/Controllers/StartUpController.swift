//
//  StartUpController.swift
//  Vision
//
//  Created by Utsav Patel on 3/16/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Cocoa

class StartUpController: NSViewController {

    @IBOutlet weak var backgroundView: NSView!
    
    static func instance() -> StartUpController {
        let `id` = "StartUpController"
        return NSStoryboard.mainBoard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: id)) as! StartUpController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    } 
    
    @IBAction func CloseAction(_ sender: NSButton) {
        self.view.window?.orderOut(self)
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        backgroundView.wantsLayer = true
        backgroundView.layer?.backgroundColor = NSColor.white.cgColor
        backgroundView.layer?.cornerRadius = backgroundView.frame.size.height / 2
    }
}
