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
        
        // startUp
//        let startUp = StartUpController.instance()
//        self.presentViewController(startUp, animator: ViewControllerAnimator())
        
        let animator = ViewControllerAnimator()
        animator.squre = false
        // preference
        let preference = PreferenceController.instance()
        self.presentViewController(preference, animator: animator)
    }
    
    override func viewWillAppear() {
         super.viewWillAppear()
        
        
    }
}
