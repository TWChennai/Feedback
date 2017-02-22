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
                    let map = Map(mappingType: ObjectMapper.MappingType.fromJSON, JSON: ["type": "Sambar"])
                    let item = ItemModel(map: map)
                    
                    item?.mapping(map: map)
                    expect(item?.name).to(equal("Sambar"))
                }
            }
        }
    }
}
