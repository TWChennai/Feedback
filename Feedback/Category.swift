import Foundation
import ObjectMapper

class CategoryModel: Mappable {
    var name: String?
    // swiftlint:disable:next variable_name
    var id: String?

    required init?(map: Map) {
    }

    init() {
    }

    func mapping(map: Map) {
        name <- map["name"]
        id <- map["_id"]
    }
}
