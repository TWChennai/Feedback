import Foundation
import UIKit

protocol FeedbackWireFrameProtocol: class
{
    /**
     * Add your methods for communication PRESENTER -> WIREFRAME
     */
    func presentFeedbackView(window: UIWindow)
}

protocol FeedbackPresenterProtocol: class
{
    var view: FeedbackViewProtocol? { get set }
    var interactor: FeedbackInteractorProtocol? { get set }
    var wireFrame: FeedbackWireFrameProtocol? { get set }
    /**
     * Add here your methods for communication VIEW -> PRESENTER
     */
    
    var feedback: FeedbackModel? { get set }
    func onViewDidLoad();
}

protocol FeedbackViewProtocol: class
{
    var presenter: FeedbackPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    func showFeedback(feedback: FeedbackModel)
}

protocol FeedbackInteractorProtocol: class
{
    var presenter: FeedbackPresenterProtocol? { get set }
    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    
    func getFeedback() -> FeedbackModel
}





