//
//  NSAlert.swift
//  Vision
//
//  Created by Utsav Patel on 14/03/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Foundation
import Cocoa

extension NSAlert {
    
   static func showWith(title: String,
                        messageText message:String,
                        firstButton firstTitle: String,
                        firstAction : Closure,
                        secondButton secondTitle: String,
                        secondAction : Closure) {
    
        let alert: NSAlert = NSAlert()
        alert.messageText = title
        alert.informativeText = message
        alert.alertStyle = NSAlert.Style.warning
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        let res = alert.runModal()
        if res == NSApplication.ModalResponse.alertFirstButtonReturn {
            firstAction()
        }
    
        if res == NSApplication.ModalResponse.alertSecondButtonReturn {
            secondAction()
        }
        
    }
}
