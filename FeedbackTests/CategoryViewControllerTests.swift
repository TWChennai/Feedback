import Foundation
import Quick
import Nimble
import Cuckoo

@testable import Feedback

class CategoryViewControllerTests: QuickSpec {
    
    override func spec() {
        describe("In category view") {
            let categoryView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "category") as! CategoryViewController
            context("view did load") {
                it("should set the header title") {
                    let title: String = "title"
                    categoryView.heading = title

                    _ = categoryView.view

                    expect(categoryView.header.text) == title
                }
            }
        }
    }
}
