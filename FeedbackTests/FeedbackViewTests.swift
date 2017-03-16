import Foundation
import Quick
import Nimble
import Cuckoo
import ReactiveSwift
import CoreData
import enum Result.NoError

@testable import Feedback

extension FeedbackView {
    private struct CustomPropertyStruct {
        static var segueCalled: Bool?
    }

    var segueCalled: Bool! {
        get {
            return CustomPropertyStruct.segueCalled
        }
        set {
            CustomPropertyStruct.segueCalled = newValue
        }
    }

    override open func performSegue(withIdentifier identifier: String, sender: Any?) {
        segueCalled = true
    }
}

class FeedbackViewTests: QuickSpec {

    override func spec() {

        describe("In feedback view") {

            let feedbackView = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "feedbackView") as! FeedbackView
            // swiftlint:disable:previous force_cast
            context("view did load") {
                pending("should get data from view model") {
                    let feedbackService = MockFeedbackService()
                    feedbackView.feedbackService = feedbackService
                    
                    stub(feedbackService) { viewmodel in
                        when(viewmodel.getItems(categoryId: anyString()))
                            .then({ (_) -> SignalProducer<[ItemModel], NoError> in
                            return SignalProducer<[ItemModel], NoError> {
                                sink, _ in
                                let items = [ItemModel(name: "sdfds")]
                                sink.send(value: items)
                            }
                        })
                    }

                    _ = feedbackView.view

                    verify(feedbackService).getItems(categoryId: anyString())
                }
            }

            context("menu view") {

                it("should have count same as number of menu") {
                    let feedbackView = FeedbackView()
                    feedbackView.items = []
                    let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
                    expect(feedbackView.collectionView(collectionView, numberOfItemsInSection: 1)).to(equal(0))
                    feedbackView.items = [NSManagedObject(), NSManagedObject()]
                    expect(feedbackView.collectionView(collectionView, numberOfItemsInSection: 1)).to(equal(2))
                }

                pending("should create new cell based on index path") {
                    feedbackView.loadView()
                    let itemOneName: String = "ItemOne"
                    let itemOne: ItemModel = ItemModel()
                    itemOne.name = itemOneName
                    feedbackView.items = [NSManagedObject()]

                    let uiCell: ItemCellView = feedbackView.collectionView(feedbackView.collectionView, cellForItemAt:
                        IndexPath(row: 0, section: 0)) as! ItemCellView
                    // swiftlint:disable:previous force_cast
                    expect(uiCell.name.text).to(equal(itemOneName))
                }

                pending("should show the menu in feedback capture area") {
                    feedbackView.loadView()
                    let itemOneName: String = "ItemOne"
                    let itemOnePredefinedFeedbacks: [String] = ["feedbackOne", "feedbackTwo"]
                    let itemOne: ItemModel = ItemModel()
                    itemOne.name = itemOneName
                    itemOne.predefinedFeedbacks = itemOnePredefinedFeedbacks
                    feedbackView.items = [NSManagedObject()]
                    feedbackView.collectionView(feedbackView.collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
                    
                    expect(feedbackView.currentItem) == NSManagedObject()
                }

                pending("onLoadedAllItems should set the feedback view's items") {
                    feedbackView.loadView()
                    let itemOneName: String = "ItemOne"
                    let itemOnePredefinedFeedbacks: [String] = ["feedbackOne", "feedbackTwo"]
                    let expectedItemOne: ItemModel = ItemModel()
                    expectedItemOne.name = itemOneName
                    expectedItemOne.predefinedFeedbacks = itemOnePredefinedFeedbacks
                    
                    let itemTwoName: String = "ItemTwo"
                    let itemTwoPredefinedFeedbacks: [String] = ["feedbackOne", "feedbackTwo"]
                    let expectedItemTwo: ItemModel = ItemModel()
                    expectedItemTwo.name = itemTwoName
                    expectedItemTwo.predefinedFeedbacks = itemTwoPredefinedFeedbacks
                    
//                    feedbackView.onLoadedAllItems(items: [expectedItemOne, expectedItemTwo])
                    
                    let itemTwo = feedbackView.items[1]
                    expect(itemTwo) == NSManagedObject()
                    expect(feedbackView.currentItem) == NSManagedObject()
                }
            }

            context("side menu") {
                pending("should show/hide side menu") {
                    expect(feedbackView.leadingConstraint.constant) == feedbackView.sideMenuHideOrigin
                    feedbackView.showSideMenu(UISwipeGestureRecognizer())
                    expect(feedbackView.leadingConstraint.constant) == 0

                    feedbackView.hideSideMenu(UISwipeGestureRecognizer())
                    expect(feedbackView.leadingConstraint.constant) == feedbackView.sideMenuHideOrigin
                }

                pending("navigate to categories page") {
                    feedbackView.showSideMenu(UISwipeGestureRecognizer())

                    feedbackView.showFoodCategories(feedbackView)

                    expect(feedbackView.leadingConstraint.constant) == feedbackView.sideMenuHideOrigin
                    expect(feedbackView.segueCalled).to(beTrue())
                }
            }
        }
    }
}
