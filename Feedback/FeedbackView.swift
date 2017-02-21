import UIKit

class FeedbackView: UIViewController, FeedbackViewProtocol {
    var presenter: FeedbackPresenterProtocol?
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var itemsScrollView: UIScrollView!
    
    func showFeedback(feedback: FeedbackModel){
        titleText.text = feedback.name
        initializeScrollBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter!.onViewDidLoad()
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
        var index = 0
        
        for image in myImages {
            
            let myImage:UIImage = UIImage(named: image)!
            let uiButton = UIButton()
            uiButton.setImage(myImage, for: UIControlState.normal)
            
            uiButton.frame.size.width = imageWidth
            uiButton.frame.size.height = imageHeight
            uiButton.frame.origin.x = xPosition
            uiButton.frame.origin.y = 10
//            uiButton.restorationIdentifier = String(index)
//            uiButton.setTitle(String(index), for: UIControlState.normal)
            index+=1
            
            itemsScrollView.addSubview(uiButton)
            xPosition += imageWidth + spacer
            scrollViewSize += (imageWidth)
            
        }
        
        itemsScrollView.contentSize = CGSize(width: scrollViewSize + 200, height: imageHeight)
        
    }
}

