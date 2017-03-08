import Foundation
import Quick
import Nimble
import Cuckoo
import ReactiveSwift
import enum Result.NoError

@testable import Feedback

class CaptureFeedbackViewTests: QuickSpec {

    override func spec() {
        
        describe("In feedback view") {
            
            let feedbackView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "feedbackView") as! FeedbackView
            
            context("table view") {
                
                it("should have count same as number of predefined feedback") {
                    _ = feedbackView.view
                    let item = ItemModel()
                    let predefinedFeedbacks = ["one", "two", "three"]
                    item.predefinedFeedbacks = predefinedFeedbacks

                    feedbackView.currentItem = ItemModel()
                    expect(feedbackView.tableView(feedbackView.predefinedFeedback, numberOfRowsInSection: 1)) == 0

                    feedbackView.currentItem = item
                    expect(feedbackView.tableView(feedbackView.predefinedFeedback, numberOfRowsInSection: 1)) == predefinedFeedbacks.count
                }
                
                it("should load the content of the predefined feedback") {
                    _ = feedbackView.view
                    let item = ItemModel()
                    item.predefinedFeedbacks = ["one", "two", "three"]
                    feedbackView.currentItem = item

                    let cell: UITableViewCell = feedbackView.tableView(feedbackView.predefinedFeedback, cellForRowAt: IndexPath(row: 1, section: 0))

                    expect(cell.textLabel?.text) == "two"
                }
                
                it("should have count same as number of predefined feedback") {
                    let row = 0
                    let mockFeedbackService = MockFeedbackService()
                    feedbackView.viewModel = mockFeedbackService
                    let item = ItemModel()
                    item.predefinedFeedbacks = ["one", "two", "three"]
                    feedbackView.currentItem = item
                    _ = feedbackView.view

                    stub(mockFeedbackService) { viewmodel in
                        when(viewmodel.addFeedback(item: any(), feedback: any())).then({ (ItemModel,String) -> SignalProducer<(), NoError> in
                            return SignalProducer<(), NoError> { sink, disposable in
                                 sink.sendCompleted()
                            }
                        })
                    }

                    feedbackView.tableView(feedbackView.predefinedFeedback, didHighlightRowAt: IndexPath(row: row, section: 0))


                    verify(mockFeedbackService).addFeedback(item: any(), feedback: any())
                }
            }
        }
    }
}
