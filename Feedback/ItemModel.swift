import Foundation
import ObjectMapper

class ItemModel: Mappable {
    var name: String?
    var predefinedFeedbacks: [String] = []

    required init?(map: Map) {
    }

    init(name: String) {
        self.name = name
    }

    init() {
    }

    func mapping(map: Map) {
        name <- map["type"]
        predefinedFeedbacks <- map["feedback"]
    }
}
