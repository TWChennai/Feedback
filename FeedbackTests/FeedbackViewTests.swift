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
            
            context("menu view") {
                it("should have count same as number of menu") {
                    let feedbackView = FeedbackView()
                    feedbackView.items = []
                    let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
                    expect(feedbackView.collectionView(collectionView, numberOfItemsInSection: 1)).to(equal(0))
                    feedbackView.items = [ItemModel(), ItemModel()]
                    expect(feedbackView.collectionView(collectionView, numberOfItemsInSection: 1)).to(equal(2))
                }
            }
        }
    }
}
