import Foundation
import Quick
import Nimble
import Cuckoo
import ReactiveSwift
import enum Result.NoError
import UIKit
import XCTest
import KIF
import PactConsumerSwift

@testable import Feedback

extension XCTestCase {
    func tester(_ file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(_ file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

class FeedbackViewTests: KIFTestCase {
    func testRice() {
        
        let feedbackView = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "feedbackView") as! FeedbackView
        // swiftlint:disable:previous force_cast
        let mockService = MockService(provider: "Mock service", consumer: "Ios client")
        
        mockService.uponReceiving("a request for items")
            .withRequest(method:.GET, path: "/items", query: ["categoryId": "57b048b0-2002-41f3-908f-103faba36e96"])
            .willRespondWith(status: 200, headers: ["Content-Type": "application/json"],
                             body: [["_id":"3ead3490-d5c1-43fc-8ef4-2714d1f73475", "type":"Rice", "categoryId":"57b048b0-2002-41f3-908f-103faba36e96", "feedback":["good","uncooked","overcooked"]]])
        
        mockService.run { (testComplete) -> Void in
            // UIApplication.shared.keyWindow!.rootViewController = feedbackView
            self.tester().waitForView(withAccessibilityIdentifier: "sanjeev")
            self.tester().waitForView(withAccessibilityIdentifier: "rice")
            //self.tester().tapView(withAccessibilityLabel: "sambar")
            self.tester().tapView(withAccessibilityIdentifier: "sanjeev")
            self.tester().swipeView(withAccessibilityIdentifier: "sanjeev_flirts", in: KIFSwipeDirection(rawValue: 0)!)
            XCTAssert(true)
            testComplete()
        }
    }
}

/*
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

    // swiftlint:disable:next function_body_length
    override func spec() {

        describe("In feedback view") {
/*
            let feedbackView = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "feedbackView") as! FeedbackView
            // swiftlint:disable:previous force_cast
            context("view did load") {
                it("should get data from view model") {
                    let feedbackService = MockFeedbackService()
                    feedbackView.feedbackService = feedbackService

                    stub(feedbackService) { feedbackService in
                        when(feedbackService.getItems(categoryId: anyString()))
                            .then({ (_) -> SignalProducer<[ItemModel], NoError> in
                            return SignalProducer<[ItemModel], NoError> {sink, _ in
                                let items = [ItemModel(name: "sdfds")]
                                sink.send(value: items)
                            }
                        })
                    }

                    _ = feedbackView.view

                    verify(feedbackService).getItems(categoryId: anyString())
                }
            }
*/
            context("menu view") {

                it("should have count same as number of menu") {
                    let feedbackView = FeedbackView()
                    UIApplication.shared.keyWindow!.rootViewController = feedbackView
                    feedbackView.items = []
                    let collectionView =
                        UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
                    //expect(feedbackView.collectionView(collectionView, numberOfItemsInSection: 1)).to(equal(0))
                    feedbackView.items = [ItemModel(), ItemModel()]
                    expect(feedbackView.collectionView(collectionView, numberOfItemsInSection: 1)).to(equal(2))
                    self.tester().tapView(withAccessibilityIdentifier: "Green Cell Identifier")
                }
            }
/*
                it("should create new cell based on index path") {
                    feedbackView.loadView()
                    let itemOneName: String = "ItemOne"
                    let itemOne: ItemModel = ItemModel()
                    itemOne.name = itemOneName
                    feedbackView.items = [itemOne]

                    let uiCell: ItemCellView = feedbackView.collectionView(feedbackView.collectionView, cellForItemAt:
                        IndexPath(row: 0, section: 0)) as! ItemCellView
                    // swiftlint:disable:previous force_cast

                    expect(uiCell.name.text).to(equal(itemOneName))
                }

                it("should show the menu in feedback capture area") {
                    feedbackView.loadView()
                    let itemOneName: String = "ItemOne"
                    let itemOnePredefinedFeedbacks: [String] = ["feedbackOne", "feedbackTwo"]
                    let itemOne: ItemModel = ItemModel()
                    itemOne.name = itemOneName
                    itemOne.predefinedFeedbacks = itemOnePredefinedFeedbacks
                    feedbackView.items = [itemOne]
                    feedbackView
                        .collectionView(feedbackView.collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))

                    expect(feedbackView.currentItem) == itemOne
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
                    expect(itemTwo) == expectedItemTwo
                    expect(feedbackView.currentItem) == expectedItemOne
                }
            }

            context("side menu") {
                it("should show/hide side menu") {
                    expect(feedbackView.leadingConstraint.constant) == feedbackView.sideMenuHideOrigin
                    feedbackView.showSideMenu(UISwipeGestureRecognizer())
                    expect(feedbackView.leadingConstraint.constant) == 0

                    feedbackView.hideSideMenu(UISwipeGestureRecognizer())
                    expect(feedbackView.leadingConstraint.constant) == feedbackView.sideMenuHideOrigin
                }

                it("navigate to categories page") {
                    feedbackView.showSideMenu(UISwipeGestureRecognizer())

                    feedbackView.showFoodCategories(feedbackView)

                    expect(feedbackView.leadingConstraint.constant) == feedbackView.sideMenuHideOrigin
                    expect(feedbackView.segueCalled).to(beTrue())
                }
            }
 */
        }
    }
}
*/
