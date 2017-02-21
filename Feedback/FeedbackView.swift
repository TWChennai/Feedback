import UIKit
class FeedbackView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, FeedbackViewProtocol{
    var presenter: FeedbackPresenterProtocol?
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let myImages = ["splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png"]
    
    func showFeedback(feedback: FeedbackModel){
        titleText.text = feedback.name
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter!.onViewDidLoad()
        presenter!.loadItems(onLoadedAllItems: onLoadedAllItems)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ItemCellView = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ItemCellView
        cell.image.image = UIImage(named: myImages[indexPath.row])
        cell.name.text = "HI"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        titleText.text = "tapped";
        print("Cell \(indexPath.row) selected")
    }
    
    func onLoadedAllItems(items: [ItemModel]){
        for item in items {
            print(item.name!)
        }
    }
    
}
       
