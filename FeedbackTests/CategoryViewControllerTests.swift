/*
import Foundation
import Quick
import Nimble
import Cuckoo
import ReactiveSwift
import enum Result.NoError

@testable import Feedback

class CategoryViewControllerTests: QuickSpec {

    override func spec() {
        describe("In category view") {
            let categoryView: CategoryViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "category") as! CategoryViewController
            // swiftlint:disable:previous force_cast
            context("view did load") {
                it("should set the header title") {
                    let title: String = "title"
                    let category = CategoryModel()
                    category.name = title
                    category.id = "id"
                    categoryView.currentCategory = category
                    let mockFeedbackService = MockFeedbackService()
                    categoryView.feedbackService = mockFeedbackService

                    stub(mockFeedbackService) { service in
                        when(service.getItems(categoryId: anyString()))
                            .then({(_) -> SignalProducer<[ItemModel], NoError> in
                            return SignalProducer<[ItemModel], NoError> { sink, _ in
                                let items = [ItemModel(name: "sdfds")]
                                sink.send(value: items)
                            }
                        })
                    }

                    _ = categoryView.view

                    expect(categoryView.header.text) == title
                    verify(mockFeedbackService).getItems(categoryId: any())
                }
            }
            context("categories table") {
                it("should have number of rows same as items") {
                    categoryView.itemList = []
                    expect(categoryView.tableView(categoryView.items, numberOfRowsInSection: 0)) == 0

                    categoryView.itemList = [ItemModel(), ItemModel()]
                    expect(categoryView.tableView(categoryView.items, numberOfRowsInSection: 0)) == 2
                }

                it("should return a cell with item name and checkmark") {
                    let item = ItemModel()
                    item.name = "itemName"
                    categoryView.itemList = [item, item]
                    let cell = categoryView.tableView(categoryView.items, cellForRowAt: IndexPath(row: 0, section: 0))
                    expect(cell.accessoryType) == UITableViewCellAccessoryType.none
                    expect(cell.textLabel?.text) == "itemName"
                }
            }
        }
    }
}
 */
