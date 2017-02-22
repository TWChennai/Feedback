//import Foundation
//import Quick
//import Nimble
//import Cuckoo
//import OHHTTPStubs
//
//@testable import Feedback
//
//class FeedbackInteractorTests: QuickSpec {
//    override func spec() {
//        
//
//        
//        describe("In feedback interactor") {
//            context("Get feedback") {
//                it("should return new model") {
//                    let feedbackInteractor = FeedbackInteractor()
//                    
//                    expect(feedbackInteractor.getFeedback() == FeedbackModel()).to(beTruthy())
//                }
//            }
//            context("Get items") {
//                it("should return items") {
//                    let feedbackInteractor = FeedbackInteractor()
//                    let stubbedItems = [["type": "value1"],["type":"value2"]]
//                    stub(condition: isHost("54.255.184.116")) { _ in
//                        return OHHTTPStubsResponse(jsonObject: stubbedItems, statusCode: 200, headers: [ "Content-Type": "application/json" ])
//                    }
//                    var called = false
//                    func abc(arg: [ItemModel]){
//                        called = true
//                    }
//                    
//                    feedbackInteractor.getItems(onLoadedAllItems: abc)
//                    
//                    expect(called).toEventually(equal(true))
//                }
//            }
//            
//        }
//    }
//}
