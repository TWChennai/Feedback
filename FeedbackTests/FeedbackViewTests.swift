import Foundation
import Quick
import Nimble
import Cuckoo

@testable import Feedback

class FeedbackViewTests: QuickSpec {
    override func spec() {
        describe("In feedback view") {
            context("view did load") {
                it("should get data from view model") {
                    let feedbackView = FeedbackView()
                    let viewmodel = MockFeedbackViewModel()
                    feedbackView.viewModel = viewmodel
                    stub(viewmodel) { viewmodel in
                        when(viewmodel.getItems(onLoadedAllItems: anyClosure())).thenDoNothing()
                    }
                    
                    feedbackView.viewDidLoad()
                    
                    verify(viewmodel).getItems(onLoadedAllItems: anyClosure())
                }
            }
            
        }
    }
}
