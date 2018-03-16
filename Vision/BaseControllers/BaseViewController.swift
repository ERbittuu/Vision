//
//  BaseViewController.swift
//  Vision
//
//  Created by Utsav Patel on 14/03/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Cocoa

class BaseViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        // startUp
        let startUp = StartUpController.instance()
        self.presentViewController(startUp, animator: ViewControllerAnimator())
    }
    
    override func viewWillAppear() {
         super.viewWillAppear()
        
        
    }
}
