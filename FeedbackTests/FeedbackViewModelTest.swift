import Foundation
import Quick
import Nimble
import Cuckoo
import OHHTTPStubs

@testable import Feedback

class FeedbackViewModelTests: QuickSpec {
    var items: Array<ItemModel> = []
    
    override func spec() {
        describe("In feedback view model") {
            context("Get items") {
                it("should return items") {
                    let feedbackViewModel = FeedbackViewModel()
                    let stubbedItems = [["type": "value1"],["type":"value2"]]
                    
                    stub(condition: isHost("54.255.184.116")) { _ in
                        return OHHTTPStubsResponse(jsonObject: stubbedItems, statusCode: 200, headers: [ "Content-Type": "application/json" ])
                    }
                    func callback(arg: [ItemModel]) {
                        self.items = arg
                    }
                    expect(self.items.count).to(equal(0))
                    
                    feedbackViewModel.getItems(onLoadedAllItems: callback)
                    
                    expect(self.items.count).toEventually(equal(2))
                }
            }
            
        }
    }
}

