import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class FeedbackService {
    
    func getItems(onLoadedAllItems: @escaping ([ItemModel]) -> ()){
        let url = ProcessInfo.processInfo.environment["FEEDBACK_BACKEND_URL"]
        Alamofire.request(url! + "/items", parameters: ["categoryId": "57b048b0-2002-41f3-908f-103faba36e96"]).responseArray { (response: DataResponse<[ItemModel]>) in
            let items = response.result.value!
            onLoadedAllItems(items)
        }
    }
    
    func addFeedback(item:ItemModel, feedback: String, onSuccess: @escaping () -> ()){
        let url = ProcessInfo.processInfo.environment["FEEDBACK_BACKEND_URL"]
        let itemName: String = item.name!
        Alamofire.request(url! + "/feedback",method: .post, parameters: ["categoryId": "57b048b0-2002-41f3-908f-103faba36e96","item": itemName, "feedback": feedback]).responseString { (response) in print(response.result.value!)
            if(response.result.isSuccess)
            {
                onSuccess()
            }
        }
    }
}
 
