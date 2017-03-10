import Foundation
import Quick
import Nimble
import ObjectMapper

@testable import Feedback

class CategoryModelTest: QuickSpec {
    override func spec() {

        describe("In category model") {
            context("mapper") {
                it("should map properly") {
                    let map = Map(mappingType: ObjectMapper.MappingType.fromJSON,
                                  JSON: ["name": "Snacks", "_id": "123", "extra": "extra"])
                    let category = CategoryModel(map: map)

                    category?.mapping(map: map)
                    expect(category?.name).to(equal("Snacks"))
                    expect(category?.id).to(equal("123"))
                }
            }
        }
    }
}
