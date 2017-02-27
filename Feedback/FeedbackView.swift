import UIKit
import SDWebImage

class FeedbackView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var viewModel: FeedbackViewModel =  FeedbackViewModel()
    var items: Array<ItemModel> = []
    let S3_URL: String = ProcessInfo.processInfo.environment["S3_URL"]!
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var itemImage: UIImageView!
    
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
        setImageOnMain(item: items[indexPath.row])
        print("Cell \(indexPath.row) selected")
    }
    
    func setImageOnMain(item: ItemModel) {
        let itemName: String = item.name!
        itemImage.sd_setImage(with: URL(string: "\(S3_URL)\(itemName.lowercased()).jpg"))
        itemImage.image?.accessibilityLabel = itemName.lowercased()
    }
    func onLoadedAllItems(items: [ItemModel]) {
        self.items = items
        collectionView.reloadData()
        setImageOnMain(item: items[0])
    }
    
}
       
