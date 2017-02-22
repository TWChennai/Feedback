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
                    let feedbackView = FeedbackViewMock()
                    let feedbackName = "Name"
                    let feedbackModel = FeedbackModel()
                    feedbackModel.name = feedbackName
                    let viewmodel = FeedbackViewModel()
                    viewmodel.model = feedbackModel
                    feedbackView.viewModel = viewmodel
                    feedbackView.viewDidLoad()
                    
                    expect(feedbackView.titleText.text == feedbackName).to(beTruthy())
                }
            }
            
        }
    }
}
