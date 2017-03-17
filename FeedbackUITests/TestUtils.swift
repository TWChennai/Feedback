//
//  TestUtils.swift
//  Feedback
//
//  Created by Marimuthu on 01/Mar/17.
//  Copyright © 2017 Thoughtworks. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {

    func waitforExistence(_ element: XCUIElement) {
        let exists = NSPredicate(format: "exists == true")

        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 20, handler: nil)
    }

    func waitForElementToAppear(element: XCUIElement) {
        let exists = NSPredicate(format: "exists == true")

        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 20, handler: nil)
    }

    func waitforNoExistence(_ element: XCUIElement) {
        let exists = NSPredicate(format: "exists != true")

        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 20, handler: nil)
    }

    func waitForValueContains(_ element: XCUIElement, value: String) {
        let predicateText = "value CONTAINS " + "'" + value + "'"
        let valueCheck = NSPredicate(format: predicateText)

        expectation(for: valueCheck, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 20, handler: nil)
    }
}
