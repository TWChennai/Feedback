
import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class FeedbackViewModel {
    
    var model: FeedbackModel
    init() {
        model = FeedbackModel()
    }
    func getItems(onLoadedAllItems: @escaping ([ItemModel]) -> ()){
        print("in getForAllInteveiws")
        let url = ProcessInfo.processInfo.environment["FEEDBACK_BACKEND_URL"]
        Alamofire.request(url! + "/items", parameters: ["categoryId": "57b048b0-2002-41f3-908f-103faba36e96"]).responseArray { (response: DataResponse<[ItemModel]>) in
            let items = response.result.value!
            onLoadedAllItems(items)
        }
    }
    func getName() -> String {
        return model.name
    }
}