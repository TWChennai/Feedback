import Foundation
import Quick
import Nimble
import Cuckoo

@testable import Feedback

class FeedbackPresenterTests: QuickSpec {
    override func spec() {
        
        describe("In feedback view") {
            context("View did load") {
                it("should invoke presenter's view did load") {
                    let feedbackPresenter = FeedbackPresenter()
                    let mockFeedbackView = MockFeedbackView()
                    let mockFeedbackInteractor = MockFeedbackInteractor()
                    let model = FeedbackModel()
                    stub(mockFeedbackInteractor) { stub in
                        when(stub.getFeedback()).thenReturn(model)
                    }
                    stub(mockFeedbackView) { stub in
                        when(stub.showFeedback(feedback: any())).thenDoNothing()
                    }
                    feedbackPresenter.view = mockFeedbackView
                    feedbackPresenter.interactor = mockFeedbackInteractor
                    
                    feedbackPresenter.onViewDidLoad()
    
                    let argumentCaptor = ArgumentCaptor<FeedbackModel>()
                    verify(mockFeedbackView, times(1)).showFeedback(feedback: argumentCaptor.capture())
                    expect(model === argumentCaptor.value!).to(beTruthy())
                }
            }
        }
    }
}
