import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
import enum Result.NoError
import ReactiveSwift

class FeedbackService {

    let url = ProcessInfo.processInfo.environment["FEEDBACK_BACKEND_URL"]
    
    func getItems() -> SignalProducer<[ItemModel], NoError> {
        return SignalProducer { sink, disposable in
            Alamofire.request(self.url! + "/items", parameters: ["categoryId": "57b048b0-2002-41f3-908f-103faba36e96"]).responseArray { (response: DataResponse<[ItemModel]>) in
                let items = response.result.value!
                sink.send(value: items)
            }
        }
    }
    
    func addFeedback(item:ItemModel, feedback: String) -> SignalProducer<(), NoError> {
        return SignalProducer { sink, disposable in
            let itemName: String = item.name!
            Alamofire.request(self.url! + "/feedback",method: .post, parameters: ["categoryId": "57b048b0-2002-41f3-908f-103faba36e96","item": itemName, "feedback": feedback]).responseString { (response) in
                print(response.result.value!)
                if(response.result.isSuccess)
                {
                    sink.sendCompleted()
                }
            }
        }
    }
}
 
