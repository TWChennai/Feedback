import Foundation
import Quick
import Nimble
import Cuckoo

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

class FoodCategoriesViewControllerTests : QuickSpec {

    override func spec() {
        describe("In food category view") {
            let foodCategoriesView: CategoriesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "foodcategories") as! CategoriesViewController
            context("table view") {
                it("should have the rows equal to number of categories") {
                    foodCategoriesView.categoriesList = []

                    _ = foodCategoriesView.view

                    expect(foodCategoriesView.tableView(foodCategoriesView.categories, numberOfRowsInSection: 1)) == 0

                    foodCategoriesView.categoriesList = ["1", "2", "3", "4"]
                    expect(foodCategoriesView.tableView(foodCategoriesView.categories, numberOfRowsInSection: 1)) == 4
                }

                it("should set the label to the category name") {
                    foodCategoriesView.categoriesList = ["1", "2", "3", "4"]

                    _ = foodCategoriesView.categories.reloadData()

                    let cell: UITableViewCell = foodCategoriesView.tableView(foodCategoriesView.categories, cellForRowAt: IndexPath(row: 0, section: 0))
                    expect(cell.textLabel?.text) == "1"
                }

                it("should set the label to the category name") {
                    foodCategoriesView.categoriesList = ["1", "2", "3", "4"]
                    _ = foodCategoriesView.categories.reloadData()

                    let cell: UITableViewCell = foodCategoriesView.tableView(foodCategoriesView.categories, cellForRowAt: IndexPath(row: 0, section: 0))

                    expect(cell.textLabel?.text) == "1"
                }

                it("should redirect to category page on click of a row") {
                    foodCategoriesView.categoriesList = ["1", "2"]
                    _ = foodCategoriesView.view

                    foodCategoriesView.tableView(foodCategoriesView.categories, didSelectRowAt: IndexPath(row: 0, section: 0))

                    expect(foodCategoriesView.segueCalled).to(beTrue())
                }

                it("should redirect and set the title of category page") {
                    foodCategoriesView.categoriesList = ["1", "2"]
                    _ = foodCategoriesView.view
                    foodCategoriesView.categories.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UITableViewScrollPosition.top)
                    let categoryViewController = CategoryViewController()
                    let segue = UIStoryboardSegue(identifier: "categories", source: foodCategoriesView, destination: categoryViewController)

                    foodCategoriesView.prepare(for: segue, sender: self)

                    expect(categoryViewController.heading) == "1"
                }
            }
        }
    }
}
