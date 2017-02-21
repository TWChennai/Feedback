import XCTest
import Foundation

class FeedbackUITests: XCTestCase {
    
    var app : XCUIApplication? = nil

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app?.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
//        app?.scrollViews.buttons["1"].tap()
    }
}
