import Foundation
import Quick
import Nimble
import ObjectMapper


@testable import Feedback

class ItemModelTest: QuickSpec {
    override func spec() {
        
        describe("In item model") {
            context("mapper") {
                it("should mapp properly") {
                    let feedback = ["test feedback 1", "test feedback 2"]
                    let map = Map(mappingType: ObjectMapper.MappingType.fromJSON, JSON: ["type": "Sambar", "feedback": feedback])
                    let item = ItemModel(map: map)
                    
                    item?.mapping(map: map)
                    expect(item?.name).to(equal("Sambar"))
                    expect(item?.predefinedFeedbacks).to(equal(feedback))
                }
            }
        }
    }
}
