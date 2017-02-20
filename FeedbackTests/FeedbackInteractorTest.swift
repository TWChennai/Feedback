import Foundation
import Quick
import Nimble
import Cuckoo

@testable import Feedback

class FeedbackInteractorTests: QuickSpec {
    override func spec() {
        
        describe("In feedback interactor") {
            context("Get feedback") {
                it("should return new model") {
                    let feedbackInteractor = FeedbackInteractor()
                    
                    expect(feedbackInteractor.getFeedback() == FeedbackModel()).to(beTruthy())
                }
            }
        }
    }
}
