import Foundation
import Quick
import Nimble
import Cuckoo
import OHHTTPStubs

@testable import Feedback

class FeedbackServiceTests: QuickSpec {

    // swiftlint:disable:next function_body_length
    override func spec() {
        describe("In feedback view model") {
            context("Get items") {
                it("should return items") {
                    let feedbackService = FeedbackService()
                    let stubbedItems = [["type": "value1"], ["type": "value2"]]

                    stub(condition: isHost("54.255.184.116")) { _ in
                        return OHHTTPStubsResponse(jsonObject: stubbedItems, statusCode: 200,
                                                   headers: [ "Content-Type": "application/json" ])
                    }

                    let producer = feedbackService.getItems()

                    producer.startWithValues({(data: [ItemModel]) -> Void in
                        expect(data.count).to(equal(2))
                    })
                }
            }

            context("Get categories") {
                it("should return categories") {
                    let feedbackService = FeedbackService()
                    let stubbedCategories = [["name": "value1", "_id": "1"], ["type": "value2", "_id": "2"]]

                    stub(condition: isHost("54.255.184.116")) { _ in
                        return OHHTTPStubsResponse(jsonObject: stubbedCategories, statusCode: 200,
                                                   headers: [ "Content-Type": "application/json" ])
                    }

                    let producer = feedbackService.getCategories()

                    producer.startWithValues({(data: [CategoryModel]) -> Void in
                        expect(data.count).to(equal(2))
                    })
                }
            }

            context("Submit feedback") {
                it("should call the callback on success") {
                    let feedbackService = FeedbackService()
                    var completed = false
                    let item: ItemModel = ItemModel()
                    item.name = "test"

                    stub(condition: isHost("54.255.184.116")) { _ in
                        return OHHTTPStubsResponse(jsonObject: [:], statusCode: 200,
                                                   headers: [ "Content-Type": "application/json" ])
                    }

                    let producer = feedbackService.addFeedback(item: item, feedback: "")

                    producer.startWithCompleted {
                        completed = true
                    }

                    expect(completed).toEventually(equal(true))
                }

                it("should not call the callback if the submission fails") {
                    let feedbackService = FeedbackService()
                    var completed = false
                    let item: ItemModel = ItemModel()
                    item.name = "test"

                    stub(condition: isHost("54.255.184.116")) { _ in
                        return OHHTTPStubsResponse(jsonObject: [:], statusCode: 400,
                                                   headers: [ "Content-Type": "application/json" ])
                    }

                    let producer = feedbackService.addFeedback(item: item, feedback: "")

                    producer.startWithCompleted {
                        completed = true
                    }

                    expect(completed).toEventually(equal(false))
                }
            }
        }
    }
}
