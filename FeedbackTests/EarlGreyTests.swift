import Foundation
import EarlGrey
import XCTest
import PactConsumerSwift

@testable import Feedback

class EarlGreyTests: XCTestCase {
    func testRice() {
        let mockService = MockService(provider: "Mock service", consumer: "Ios client")
        
        mockService.uponReceiving("a request for items")
            .withRequest(method:.GET, path: "/items", query: ["categoryId": "57b048b0-2002-41f3-908f-103faba36e96"])
            .willRespondWith(status: 200, headers: ["Content-Type": "application/json"],
                             body: [["_id":"3ead3490-d5c1-43fc-8ef4-2714d1f73475", "type":"Rice", "categoryId":"57b048b0-2002-41f3-908f-103faba36e96", "feedback":["good","uncooked","overcooked"]]])
        
        mockService.run { (testComplete) -> Void in
            //UIApplication.shared.keyWindow!.rootViewController = feedbackView
    
            let feedbackView = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "feedbackView") as! FeedbackView
            // swiftlint:disable:previous force_cast
            
            EarlGrey.select(elementWithMatcher: grey_accessibilityID("sanjeev")).assert(with: grey_sufficientlyVisible())
            EarlGrey.select(elementWithMatcher: grey_accessibilityID("sanjeev_flirts")).perform(grey_swipeFastInDirection(GREYDirection.right))
            XCTAssert(true)
            testComplete()
        }
    }
}
