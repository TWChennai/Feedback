import UIKit

class FeedbackView: UIViewController, FeedbackViewProtocol {
    var presenter: FeedbackPresenterProtocol?
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var itemsScrollView: UIScrollView!
    
    func showFeedback(feedback: FeedbackModel){
        titleText.text = feedback.name
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter!.onViewDidLoad()
        initializeScrollBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initializeScrollBar() {
        
        let myImages = ["splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png"]
        
        let imageWidth:CGFloat = 66
        let imageHeight:CGFloat = 66
        let spacer: CGFloat = 10
        var xPosition:CGFloat = 0
        var scrollViewSize:CGFloat=0
        
        for image in myImages {
            
            let myImage:UIImage = UIImage(named: image)!
            let myImageView:UIImageView = UIImageView()
            myImageView.image = myImage
            
            myImageView.frame.size.width = imageWidth
            myImageView.frame.size.height = imageHeight
            myImageView.frame.origin.x = xPosition
            myImageView.frame.origin.y = 10
            
            itemsScrollView.addSubview(myImageView)
            xPosition += imageWidth + spacer
            scrollViewSize += (imageWidth)
        }
        
        itemsScrollView.contentSize = CGSize(width: scrollViewSize + 200, height: imageHeight)
        
    }
}

