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
        let cells = app?.collectionViews.cells;
        XCTAssert(app?.staticTexts.element(matching: .any, identifier: "Feedback123").label != nil)
        let cellOne = cells?.element(boundBy: 0)
        XCTAssertEqual(cells?.count,3)
        XCTAssert(cellOne?.tap() != nil)
        XCTAssert(app?.staticTexts.element(matching: .any, identifier: "tapped").label != nil)
    }
}
