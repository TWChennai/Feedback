import UIKit
import SDWebImage
import ReactiveCocoa
import ReactiveSwift
import enum Result.NoError

class FeedbackView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var viewModel: FeedbackService =  FeedbackService()

    var items: Array<ItemModel> = []
    var counts: SignalProducer<[ItemModel], NoError> = SignalProducer.empty
    var currentItem: ItemModel = ItemModel()
    let S3_URL: String = ProcessInfo.processInfo.environment["S3_URL"]!
    let SIDE_MENU_HIDE_ORIGIN: CGFloat = -185
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var predefinedFeedback: UITableView!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBAction func showFoodCategories(_ sender: Any) {
        leadingConstraint.constant = SIDE_MENU_HIDE_ORIGIN
        self.performSegue(withIdentifier: "categories", sender: self)
    }
    
    @IBAction func showSideMenu(_ sender: UISwipeGestureRecognizer) {
        self.leadingConstraint.constant = 0
        UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()})
    }
    
    @IBAction func hideSideMenu(_ sender: UISwipeGestureRecognizer) {
        leadingConstraint.constant = SIDE_MENU_HIDE_ORIGIN
        UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()})
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getItems().startWithValues({(data:[ItemModel]) -> Void in
            self.items = data
            self.collectionView.reloadData()
            self.reloadFeedbackCaptureView(item: self.items[0])
        })
        
        predefinedFeedback.tableFooterView = UIView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ItemCellView = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ItemCellView
        let itemName: String = items[indexPath.row].name!
        cell.image.sd_setImage(with: URL(string: "\(S3_URL)\(itemName.lowercased()).jpg"))
        cell.name.text = itemName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        reloadFeedbackCaptureView(item: items[indexPath.row])
    }
    
}

