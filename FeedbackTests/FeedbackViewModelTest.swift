import Foundation
import Quick
import Nimble
import Cuckoo
import OHHTTPStubs

@testable import Feedback

class FeedbackServiceTests: QuickSpec {
    var items: Array<ItemModel> = []
    
    override func spec() {
        describe("In feedback view model") {
            context("Get items") {
                it("should return items") {
                    let feedbackService = FeedbackService()
                    let stubbedItems = [["type": "value1"],["type":"value2"]]
                    
                    stub(condition: isHost("54.255.184.116")) { _ in
                        return OHHTTPStubsResponse(jsonObject: stubbedItems, statusCode: 200, headers: [ "Content-Type": "application/json" ])
                    }
                    func callback(arg: [ItemModel]) {
                        self.items = arg
                    }
                    expect(self.items.count).to(equal(0))
                    
                    feedbackService.getItems(onLoadedAllItems: callback)
                    
                    expect(self.items.count).toEventually(equal(2))
                }
            }
            
            context("Submit feedback") {
                it("should call the callback on success") {
                    var callbackCalled = false
                    let feedbackService = FeedbackService()
                    let item: ItemModel = ItemModel()
                    item.name = "test"
                    
                    stub(condition: isHost("54.255.184.116")) { _ in
                        return OHHTTPStubsResponse(jsonObject: [:], statusCode: 200, headers: [ "Content-Type": "application/json" ])
                    }
                    
                    feedbackService.addFeedback(item: item, feedback: "", onSuccess: {_ in callbackCalled = true})
                    
                    expect(callbackCalled).toEventually(equal(true))
                }
                it("should not call the callback if the submission fails") {
                    var callbackCalled = false
                    let feedbackService = FeedbackService()
                    let item: ItemModel = ItemModel()
                    item.name = "test"
                    
                    stub(condition: isHost("54.255.184.116")) { _ in
                        return OHHTTPStubsResponse(jsonObject: [:], statusCode: 400, headers: [ "Content-Type": "application/json" ])
                    }
                    
                    feedbackService.addFeedback(item: item, feedback: "", onSuccess: {_ in callbackCalled = true})
                    
                    expect(callbackCalled).toEventually(equal(false))
                }
            }
        }
    }
}

