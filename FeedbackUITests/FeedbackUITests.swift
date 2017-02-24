import XCTest
import Foundation

extension XCUIApplication {
    func launchTestsWithEnvironmentVariables() {
        launchEnvironment = [
            "FEEDBACK_BACKEND_URL" : "http://54.255.184.116:3050"
        ]
        self.launch()
    }
}

class FeedbackUITests: XCTestCase {
    
    var app : XCUIApplication? = nil

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app?.launchTestsWithEnvironmentVariables()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let cells = app?.collectionViews.cells;
        XCTAssertNotNil(app?.staticTexts.element(matching: .any, identifier: "Feedback123").label)
        sleep(5) // fix it
        let cellOne = cells?.element(boundBy: 0)
        XCTAssertEqual(cells?.count,3)
        XCTAssertNotNil(cellOne?.tap())
        XCTAssertNotNil(app?.staticTexts.element(matching: .any, identifier: "tapped").label)
    }
}
