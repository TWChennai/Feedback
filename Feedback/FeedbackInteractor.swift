import Foundation
import Alamofire
import SwiftyJSON

class FeedbackInteractor: FeedbackInteractorProtocol {
   var presenter: FeedbackPresenterProtocol?
    
    func getFeedback() -> FeedbackModel{
        getItems()
        return FeedbackModel()
    }
    
    func getItems(){
        print("in getForAllInteveiws")
        let url = ProcessInfo.processInfo.environment["FEEDBACK_BACKEND_URL"]
        Alamofire.request(url! + "/items", parameters: ["categoryId": "57b048b0-2002-41f3-908f-103faba36e96"]).responseJSON { response in
            print(response.result)
            
            if let result = response.result.value {
                print("JSON: \(result)")
                let jsonResult = JSON(array: result)
                print(jsonResult)
            }
        }
    }
}
