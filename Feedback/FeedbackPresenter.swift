import Foundation
class FeedbackPresenter : FeedbackPresenterProtocol{
    var view: FeedbackViewProtocol?
    var interactor: FeedbackInteractorProtocol?
    var wireFrame: FeedbackWireFrameProtocol?
    
    var feedback: FeedbackModel?
    func onViewDidLoad(){
        let feedback = interactor!.getFeedback()
        view!.showFeedback(feedback: feedback)
    }
    
    func loadItems(onLoadedAllItems: @escaping ([ItemModel]) -> ()) {
        interactor!.getItems(onLoadedAllItems: onLoadedAllItems)
    }
}
