import Foundation
import ObjectMapper

class ItemModel: Mappable {
    var name: String?

    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["type"]
    }
}
