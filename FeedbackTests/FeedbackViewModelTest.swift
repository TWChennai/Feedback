import Foundation
import Quick
import Nimble
import Cuckoo
import OHHTTPStubs

@testable import Feedback

class FeedbackViewModelTests: QuickSpec {
    override func spec() {
        describe("In feedback view model") {
            context("Get feedback") {
                it("should return model name") {
                    let feedbackViewModel = FeedbackViewModel()
                    
                    expect(feedbackViewModel.getName()).to(equal("Feedback123"))
                }
            }
            
            context("Get items") {
                it("should return items") {
                    var called = false
                    let feedbackInteractor = FeedbackViewModel()
                    let stubbedItems = [["type": "value1"],["type":"value2"]]
                    stub(condition: isHost("54.255.184.116")) { _ in
                        return OHHTTPStubsResponse(jsonObject: stubbedItems, statusCode: 200, headers: [ "Content-Type": "application/json" ])
                    }
                    func abc(arg: [ItemModel]){
                        called = true
                    }
                    
                    feedbackInteractor.getItems(onLoadedAllItems: abc)
                    
                    expect(called).toEventually(equal(true))
                }
            }
            
        }
    }
}

