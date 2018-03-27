//
//  PreferenceController.swift
//  Vision
//
//  Created by Utsav Patel on 3/19/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Foundation
import Cocoa

class PreferenceController: NSViewController {
    
    @IBOutlet weak var runAtStartupButton: OGSwitch!
    @IBOutlet weak var runAtStartupLabel: NSTextField!

    static var selfObject: NSWindowController {
        let baseWindow = BaseWindow.instance()
        return baseWindow
    }
    
    static func instance() -> PreferenceController {
        let `id` = "PreferenceController"
        return NSStoryboard.mainBoard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: id)) as! PreferenceController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        runAtStartupButton.setOn(isOn: Defaults[.startAtLogin], animated: false)
        runAtStartupButton.target = self
        runAtStartupButton.action = #selector(runAtStartUpAction(sender:))
        
        updateRunAtStartupLabel()
    }
    
    @objc func runAtStartUpAction(sender: OGSwitch) {
        Defaults[.startAtLogin] = sender.isOn
        LaunchHelper.shared.launcherChanges { (success) in
            if success {
                Helper.shared.startupSet2Enabled()
            }else{
                Helper.shared.startupSet2Disabled()
            }
        }
    }
    
    @IBAction func closeAction(_ sender: NSButton) {
        self.view.window?.orderOut(self)
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
    }
    
    func updateRunAtStartupLabel() {
        let titleEnabled = "Start Vision on system start 😃"
        let titleDisabled = "Vision can't start on system start 😔"
        
        runAtStartupLabel.stringValue = Defaults[.startAtLogin] ? titleEnabled : titleDisabled
    }
}
