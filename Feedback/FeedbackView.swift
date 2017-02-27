import UIKit
import SDWebImage
import Toast_Swift

class FeedbackView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {
    var viewModel: FeedbackViewModel =  FeedbackViewModel()
    var items: Array<ItemModel> = []
    var currentItem: ItemModel = ItemModel()
    let S3_URL: String = ProcessInfo.processInfo.environment["S3_URL"]!
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var predefinedFeedback: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = viewModel.getName()
        viewModel.getItems(onLoadedAllItems: onLoadedAllItems)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        reloadWith(item: items[indexPath.row])
        print("Cell \(indexPath.row) selected")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentItem.predefinedFeedbacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeedbackCell")!
        cell.textLabel?.text = currentItem.predefinedFeedbacks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let feedback = currentItem.predefinedFeedbacks[indexPath.row]
        viewModel.addFeedback(item: currentItem, feedback: feedback, onSuccess: successfullySubmitted)
    }
    
    func reloadWith(item: ItemModel) {
        let itemName: String = item.name!
        itemImage.sd_setImage(with: URL(string: "\(S3_URL)\(itemName.lowercased()).jpg"))
        itemImage.image?.accessibilityLabel = itemName.lowercased()
        currentItem = item
        predefinedFeedback.reloadData()
    }
    
    func onLoadedAllItems(items: [ItemModel]) {
        self.items = items
        collectionView.reloadData()
        reloadWith(item: items[0])
    }
    
    func successfullySubmitted() {
        self.view.makeToast("Feedback submitted")
    }
    
}
       
