//
//  MonkeyTests.swift
//  Feedback
//
//  Created by Marimuthu on 01/Mar/17.
//  Copyright © 2017 Thoughtworks. All rights reserved.
//

import Foundation
import XCTest
import SwiftMonkey

class MonkeyTests: XCTestCase {
    func testMonkeyTest() {
        let application = XCUIApplication()
        application.launchTestsWithEnvironmentVariables()
        XCUIDevice.shared().orientation = .portrait
        _ = application.descendants(matching: .any).element(boundBy: 0).frame
        
        let monkey = Monkey(frame: application.frame)
        monkey.addDefaultXCTestPrivateActions()
        monkey.addDefaultUIAutomationActions()
        
        monkey.addXCTestTapAlertAction(interval: 100, application: application)
        
        // Run the monkey test indefinitely.
        monkey.monkeyAround(iterations: 1000)
        report_memory()

    }
    
    func report_memory() {
        var info = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
        
        let kerr: kern_return_t = withUnsafeMutablePointer(to: &info) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_,
                          task_flavor_t(MACH_TASK_BASIC_INFO),
                          $0,
                          &count)
            }
        }
        
        if kerr == KERN_SUCCESS {
            print("Memory in use (in bytes): \(info.resident_size)")
        }
        else {
            print("Error with task_info(): " +
                (String(cString: mach_error_string(kerr), encoding: String.Encoding.ascii) ?? "unknown error"))
        }
    }

}
