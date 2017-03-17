import Foundation
import Quick
import Nimble
import Cuckoo
import ReactiveSwift
import enum Result.NoError

@testable import Feedback

extension CategoriesViewController {
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

class CategoriesViewControllerTests: QuickSpec {

    // swiftlint:disable:next function_body_length
    override func spec() {
        describe("In food category view") {
            let categoriesView: CategoriesViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "foodcategories") as! CategoriesViewController
            // swiftlint:disable:previous force_cast
            context("in view did load") {
                it("should get all the categories") {
                    let mockFeedbackService = MockFeedbackService()
                    categoriesView.feedbackService = mockFeedbackService

                    stub(mockFeedbackService) { service in
                        when(service.getCategories()).then({ () -> SignalProducer<[CategoryModel], NoError> in
                            return SignalProducer<[CategoryModel], NoError> { sink, _ in
                                let categories = [CategoryModel()]
                                sink.send(value: categories)
                            }
                        })
                    }

                    _ = categoriesView.view

                    verify(mockFeedbackService).getCategories()
                }
            }
            context("table view") {
                it("should have the rows equal to number of categories") {
                    categoriesView.categoriesList = []
                    let categoryModel = CategoryModel()

                    _ = categoriesView.view

                    expect(categoriesView.tableView(categoriesView.categories, numberOfRowsInSection: 1)) == 0

                    categoriesView.categoriesList = [categoryModel, categoryModel, categoryModel, categoryModel]
                    expect(categoriesView.tableView(categoriesView.categories, numberOfRowsInSection: 1)) == 4
                }

                it("should set the label to the category name") {
                    let categoryModel = CategoryModel()
                    let categoryModelName = "name"
                    categoryModel.name = "name"
                    categoriesView.categoriesList = [categoryModel]

                    _ = categoriesView.categories.reloadData()

                    let cell: UITableViewCell = categoriesView.tableView(categoriesView.categories,
                                                                         cellForRowAt: IndexPath(row: 0, section: 0))
                    expect(cell.textLabel?.text) == categoryModelName
                }

                it("should redirect to category page on click of a row") {
                    categoriesView.categoriesList = [CategoryModel(), CategoryModel()]
                    _ = categoriesView.view

                    categoriesView.tableView(categoriesView.categories, didSelectRowAt: IndexPath(row: 0, section: 0))

                    expect(categoriesView.segueCalled).to(beTrue())
                }

                it("should redirect and set the title of category page") {
                    let categoryModel = CategoryModel()
                    let categoryModelName = "name"
                    categoryModel.name = "name"
                    categoriesView.categoriesList = [categoryModel, categoryModel]
                    _ = categoriesView.view
                    categoriesView.categories.selectRow(at: IndexPath(row: 0, section: 0), animated: false,
                                                        scrollPosition: UITableViewScrollPosition.top)
                    let categoryViewController = CategoryViewController()
                    let segue = UIStoryboardSegue(identifier: "categories", source: categoriesView,
                                                  destination: categoryViewController)

                    categoriesView.prepare(for: segue, sender: self)

                    expect(categoryViewController.currentCategory?.name) == categoryModelName
                }
            }
        }
    }
}
