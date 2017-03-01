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



class BaseTest: XCTestCase {
    
    let app = XCUIApplication()
    let feedbackPage=FeedbackPage()

    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        app.launchTestsWithEnvironmentVariables()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    

    
}
