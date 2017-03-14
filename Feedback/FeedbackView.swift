import UIKit
import SDWebImage
import ReactiveCocoa
import ReactiveSwift
import enum Result.NoError
import CoreData

class FeedbackView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var viewModel: FeedbackService =  FeedbackService()

    var items: [NSManagedObject] = []
    var counts: SignalProducer<[ItemModel], NoError> = SignalProducer.empty
    var currentItem: NSManagedObject?
    // swiftlint:disable:next variable_name
    let S3_URL: String = ProcessInfo.processInfo.environment["S3_URL"]!
    let sideMenuHideOrigin: CGFloat = -185

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var predefinedFeedback: UITableView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!

    @IBAction func showFoodCategories(_ sender: Any) {
        leadingConstraint.constant = sideMenuHideOrigin
        self.performSegue(withIdentifier: "categories", sender: self)
    }

    @IBAction func showSideMenu(_ sender: UISwipeGestureRecognizer) {
        self.leadingConstraint.constant = 0
        UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()})
    }

    @IBAction func hideSideMenu(_ sender: UISwipeGestureRecognizer) {
        leadingConstraint.constant = sideMenuHideOrigin
        UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()})
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        predefinedFeedback.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ActivatedItems")
        do {
            items = try managedContext.fetch(fetchRequest)
            currentItem = items[0]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        self.collectionView.reloadData()
        self.reloadFeedbackCaptureView(item: self.items[0])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
        let cell: ItemCellView = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                                    for: indexPath) as! ItemCellView
        // swiftlint:disable:previous force_cast
        let itemName: String = (items[indexPath.row].value(forKey: "name") as? String)!
        cell.image.sd_setImage(with: URL(string: "\(S3_URL)\(itemName.lowercased()).jpg"))
        cell.name.text = itemName
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        reloadFeedbackCaptureView(item: items[indexPath.row])
    }

}
