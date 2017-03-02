import Foundation
import Quick
import Nimble
import Cuckoo

@testable import Feedback

class FeedbackViewTests: QuickSpec {
    
    override func spec() {
        describe("In feedback view") {
            let feedbackView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "feedbackView") as! FeedbackView
            context("view did load") {
                it("should get data from view model") {
                    let viewmodel = MockFeedbackViewModel()
                    feedbackView.viewModel = viewmodel
                    
                    stub(viewmodel) { viewmodel in
                        when(viewmodel.getItems(onLoadedAllItems: anyClosure())).thenDoNothing()
                    }
                    
                    _ = feedbackView.view
                    
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
                
                it("should create new cell based on index path") {
                    feedbackView.loadView()
                    let itemOneName: String = "ItemOne"
                    let itemOne: ItemModel = ItemModel()
                    itemOne.name = itemOneName
                    feedbackView.items = [itemOne]
                    
                    let uiCell: ItemCellView = feedbackView.collectionView(feedbackView.collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as! ItemCellView
                    
                    expect(uiCell.name.text).to(equal(itemOneName))
                }
                
                it("should show the menu in feedback capture area") {
                    feedbackView.loadView()
                    let itemOneName: String = "ItemOne"
                    let itemOnePredefinedFeedbacks: Array<String> = ["feedbackOne", "feedbackTwo"]
                    let itemOne: ItemModel = ItemModel()
                    itemOne.name = itemOneName
                    itemOne.predefinedFeedbacks = itemOnePredefinedFeedbacks
                    feedbackView.items = [itemOne]
                    feedbackView.collectionView(feedbackView.collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
                    
                    expect(feedbackView.currentItem) == itemOne
                }
                
                it("onLoadedAllItems should set the feedback view's items") {
                    feedbackView.loadView()
                    let itemOneName: String = "ItemOne"
                    let itemOnePredefinedFeedbacks: Array<String> = ["feedbackOne", "feedbackTwo"]
                    let expectedItemOne: ItemModel = ItemModel()
                    expectedItemOne.name = itemOneName
                    expectedItemOne.predefinedFeedbacks = itemOnePredefinedFeedbacks
                    
                    let itemTwoName: String = "ItemTwo"
                    let itemTwoPredefinedFeedbacks: Array<String> = ["feedbackOne", "feedbackTwo"]
                    let expectedItemTwo: ItemModel = ItemModel()
                    expectedItemTwo.name = itemTwoName
                    expectedItemTwo.predefinedFeedbacks = itemTwoPredefinedFeedbacks
                    
                    feedbackView.onLoadedAllItems(items: [expectedItemOne, expectedItemTwo])
                    
                    let itemTwo = feedbackView.items[1]
                    expect(itemTwo) == expectedItemTwo
                    expect(feedbackView.currentItem) == expectedItemOne
                }
            }
        }
    }
}
