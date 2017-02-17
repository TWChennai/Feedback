import Foundation
import UIKit
class FeedbackWireFrame : FeedbackWireFrameProtocol {
    func presentFeedbackView(window: UIWindow) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier :"feedbackView") as! FeedbackView
        let presenter: FeedbackPresenterProtocol = FeedbackPresenter()
        let interactor: FeedbackInteractorProtocol = FeedbackInteractor()
        let wireFrame: FeedbackWireFrameProtocol = FeedbackWireFrame();
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        let navigationController = UINavigationController(rootViewController: view as UIViewController)
        navigationController.navigationBar.isTranslucent = false
        window.rootViewController = navigationController
        window.makeKeyAndVisible();
    }
}
