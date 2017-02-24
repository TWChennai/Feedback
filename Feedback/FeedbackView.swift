import UIKit

class FeedbackView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var viewModel: FeedbackViewModel =  FeedbackViewModel()
    var items: Array<ItemModel> = []
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    let myImages = ["splash.png","feedback.jpeg","splash.png","feedback.jpeg","splash.png","feedback.jpeg","splash.png","splash.png","splash.png","splash.png","splash.png","splash.png"]
    
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
        cell.image.image = UIImage(named: myImages[indexPath.row])
        cell.name.text = items[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        titleText.text = "tapped";
        itemImage.image = UIImage(named: myImages[indexPath.row])
        itemImage.image?.accessibilityLabel = myImages[indexPath.row]
        print("Cell \(indexPath.row) selected")
    }
    
    func onLoadedAllItems(items: [ItemModel]) {
        self.items = items
        collectionView.reloadData()
    }
    
}
       
