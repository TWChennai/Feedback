import XCTest
import Quick
import Nimble
import Foundation
import OHHTTPStubs
import Cuckoo

extension XCUIApplication {
    func launchTestsWithEnvironmentVariables() {
        launchEnvironment = [
            "FEEDBACK_BACKEND_URL" : "mywebservice.com"
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
    
//    func testExample() {
//        let stubbedInterviews = "Interview 1"
//        stub(condition: isHost("mywebservice.com")) { _ in
//            let interview = [stubbedInterviews]
//            let stubData: Data = NSKeyedArchiver.archivedData(withRootObject: interview) as Data
//            return OHHTTPStubsResponse(data: stubData, statusCode: 200, headers: nil)
//        }
//        let cells = app?.collectionViews.cells;
//        XCTAssert(app?.staticTexts.element(matching: .any, identifier: "Feedback123").label != nil)
//        let cellOne = cells?.element(boundBy: 0)
//        XCTAssertEqual(cells?.count,3)
//        XCTAssert(cellOne?.tap() != nil)
//        XCTAssert(app?.staticTexts.element(matching: .any, identifier: "tapped").label != nil)
//    }
}
