//
//  NSMenu.swift
//  Vision
//
//  Created by Utsav Patel on 4/4/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Foundation
import Cocoa

extension NSMenu {
    enum Tag : Int {
        typealias RawValue = Int
        
        case onOff = 1
        case tips = 2
        case quit = 3
        
        case sound = 101
        case autoStart = 102
        case text = 103
        case slider = 104
        
        var onTitle : String {
            switch self {
            case .onOff:
                return "Enabled 😃"
            case .tips:
                return "Tips 📕"
            case .quit:
                return "Quit 😞"
            case .sound:
                return "Sound 🎼"
            case .autoStart:
                return "Auto start 🖥"
            default:
                return ""
            }
        }
        
        var offTitle : String {
            switch self {
            case .onOff:
                return "Disabled 😔"
            case .tips:
                return "Tips 📕"
            case .quit:
                return "Quit 😞"
            case .sound:
                return "Sound 🎼"
            case .autoStart:
                return "Auto start 🖥"
            default:
                return ""
            }
        }
        
        var title : String {
            return (state == NSControl.StateValue.on) ? onTitle : offTitle
        }
        
        var state : NSControl.StateValue {
            var onOff = false
            switch self {
            case .onOff:
                onOff = Defaults[.running]
            case .tips:
                onOff = true
            case .quit:
                onOff = true
            case .sound:
                onOff = Defaults[.sound]
            case .autoStart:
                onOff = Defaults[.autoStart]
            default:
                onOff = true
            }
            return onOff ? NSControl.StateValue.on : NSControl.StateValue.off
        }
    }
}
