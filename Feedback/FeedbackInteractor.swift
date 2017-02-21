import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class FeedbackInteractor: FeedbackInteractorProtocol {
   var presenter: FeedbackPresenterProtocol?
    
    func getFeedback() -> FeedbackModel{
        getItems()
        return FeedbackModel()
    }
    
    func getItems(){
        print("in getForAllInteveiws")
        let url = ProcessInfo.processInfo.environment["FEEDBACK_BACKEND_URL"]
        Alamofire.request(url! + "/items", parameters: ["categoryId": "57b048b0-2002-41f3-908f-103faba36e96"]).responseArray { (response: DataResponse<[ItemModel]>) in
            let items = response.result.value!
            for item in items {
                print(item.name!)
            }
        }
    }
}
