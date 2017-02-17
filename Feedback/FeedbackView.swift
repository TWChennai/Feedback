import UIKit

class FeedbackView: UIViewController, FeedbackViewProtocol {
    var presenter: FeedbackPresenterProtocol?
    
    @IBOutlet weak var titleText: UILabel!
    
    func showFeedback(feedback: FeedbackModel){
        titleText.text = feedback.name
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter!.onViewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

