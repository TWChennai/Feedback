import Foundation
import Quick
import Nimble
import Cuckoo

@testable import Feedback

class FeedbackViewTests: QuickSpec {
    class FeedbackViewMock: FeedbackView {
        let mockUiLabel =  UILabel()
        let mockUiScrollView = UIScrollView()
        
        override var titleText: UILabel! {
            get {
                return mockUiLabel
            }
            set {
                // Do nothing
            }
        }
    }

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
            
            context("Show feedback") {
                it("should set the UI name to feedback name") {
                    let feedbackView: FeedbackView = FeedbackViewMock()
                    let feedbackName = "Name"
                    let feedbackModel = FeedbackModel()
                    feedbackModel.name = feedbackName
                    feedbackView.showFeedback(feedback: feedbackModel)
                    expect(feedbackView.titleText.text == feedbackName).to(beTruthy())
                }
            }
        }
    }
}
