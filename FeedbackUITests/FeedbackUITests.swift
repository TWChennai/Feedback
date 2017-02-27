import XCTest
import Foundation

extension XCUIApplication {
    func launchTestsWithEnvironmentVariables() {
        launchEnvironment = [
            "FEEDBACK_BACKEND_URL" : "http://54.255.184.116:3050",
            "S3_URL": "https://s3.amazonaws.com/recruitx-feedback-image-qa/uploads/"
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
        let cellTwo = cells?.element(boundBy: 1)
        XCTAssertEqual(cells?.count,3)
        XCTAssertNotNil(cellTwo?.tap())
    }
}
