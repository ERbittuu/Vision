//
//  ViewControllerAnimator.swift
//  Vision
//
//  Created by Utsav Patel on 3/16/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Foundation
import Cocoa

class ViewControllerAnimator: NSObject, NSViewControllerPresentationAnimator {
    
    @objc func  animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
        let bottomVC = fromViewController
        let topVC = viewController
        topVC.view.wantsLayer = true
        topVC.view.layerContentsRedrawPolicy = .onSetNeedsDisplay
        topVC.view.alphaValue = 0
        bottomVC.view.addSubview(topVC.view)
        topVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        bottomVC.view.addConstraint(NSLayoutConstraint.init(item: bottomVC.view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topVC.view, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1.0, constant: 0))
        
        bottomVC.view.addConstraint(NSLayoutConstraint.init(item: bottomVC.view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topVC.view, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1.0, constant: 0))
        
        bottomVC.view.addConstraint(NSLayoutConstraint.init(item: bottomVC.view, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topVC.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: 0))
        
        bottomVC.view.addConstraint(NSLayoutConstraint.init(item: bottomVC.view, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: topVC.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: 0))
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            context.duration = 0.5
            topVC.view.animator().alphaValue = 1
        }, completionHandler: nil)
        
    }
    
    
    @objc func  animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
        let topVC = viewController
        topVC.view.wantsLayer = true
        topVC.view.layerContentsRedrawPolicy = .onSetNeedsDisplay
        
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            context.duration = 0.5
            topVC.view.animator().alphaValue = 0
        }, completionHandler: {
            topVC.view.removeFromSuperview()
        })
    }
    
}
