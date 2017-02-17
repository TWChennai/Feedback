import Foundation
class FeedbackInteractor: FeedbackInteractorProtocol {
   var presenter: FeedbackPresenterProtocol?
    
    func getFeedback() -> FeedbackModel{
        return FeedbackModel()
    }
}
