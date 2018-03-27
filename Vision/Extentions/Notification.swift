//
//  Notification.swift
//  Vision
//
//  Created by Utsav Patel on 3/27/18.
//  Copyright © 2018 Utsav Patel. All rights reserved.
//

import Foundation

// define the custom event name
extension NSNotification.Name {
    static let stateChange = Notification.Name("stateChange")
}

/** SENDER AGNOSTIC WRAPPERS **/

// run the closure on the sender's thread
@discardableResult public func when(_ event: Notification.Name,
                                    do closure: @escaping (Notification) -> Swift.Void) -> NSObjectProtocol {
    return NotificationCenter.default.addObserver(forName: event, object: nil, queue: nil) { note in
        closure(note)
    }
}

// run the closure on an explicit queue
@discardableResult public func when(_ event: Notification.Name, doOn queue: OperationQueue,
                                    do closure: @escaping (Notification) -> Swift.Void) -> NSObjectProtocol {
    return NotificationCenter.default.addObserver(forName: event, object: nil, queue: queue) { note in
        closure(note)
    }
}

/** SENDER EXPLICIT WRAPPERS **/

// run the closure on the sender's thread
@discardableResult public func when(_ sender: Any, does event: Notification.Name,
                                    do closure: @escaping (Notification) -> Swift.Void) -> NSObjectProtocol {
    return NotificationCenter.default.addObserver(forName: event, object: sender, queue: nil) { note in
        closure(note)
    }
}

// run the closure on an explicit queue
@discardableResult public func when(_ sender: Any, does event: Notification.Name, doOn queue: OperationQueue,
                                    do closure: @escaping (Notification) -> Swift.Void) -> NSObjectProtocol {
    return NotificationCenter.default.addObserver(forName: event, object: sender, queue: queue) { note in
        closure(note)
    }
}

// post an event
public func trigger(_ event: Notification.Name, on object: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {
    NotificationCenter.default.post(Notification(name: event, object: object, userInfo: userInfo))
}
