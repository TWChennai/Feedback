import Foundation
import Quick
import Nimble
import Cuckoo

@testable import Feedback

class FeedbackViewTests: QuickSpec {
    override func spec() {
        
        describe("In feedback view") {
            context("View did load") {
                it("should invoke presenter's view did load") {
                    let feedbackView = FeedbackView()
                    let mockFeedbackPresenter = MockFeedbackPresenter()
                    stub(mockFeedbackPresenter) { stub in
                        when(stub.onViewDidLoad()).thenDoNothing()
                    }
                    feedbackView.presenter = mockFeedbackPresenter
                    
                    feedbackView.viewDidLoad()
                    
                    verify(mockFeedbackPresenter, times(1)).onViewDidLoad()
                }
            }
        }
    }
}
