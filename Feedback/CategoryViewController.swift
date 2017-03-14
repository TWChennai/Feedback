import UIKit
import CoreData

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var currentCategory: CategoryModel?
    var itemList: [ItemModel] = []
    var feedbackService: FeedbackService = FeedbackService()

    @IBOutlet weak var header: UILabel!

    @IBOutlet weak var items: UITableView!

    func activateItems(_ sender: UIButton) {
        self.resetActivatedItems()
        let selectedRows: [IndexPath]? = self.items.indexPathsForSelectedRows
        selectedRows?.forEach({row in
                let cell = self.items.cellForRow(at: row)
                let itemName = cell?.textLabel?.text
                let itemIndex = self.itemList.index(where: {item in item.name == itemName})
                self.save(item: self.itemList[itemIndex!])
                self.items.deselectRow(at: row , animated: false)
                items.cellForRow(at: row)?.accessoryType = .none
            })
    }

    func resetActivatedItems() {
        var items: [NSManagedObject] = []
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }

        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ActivatedItems")
        do {
            items = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        items.forEach({item in managedContext.delete(item)})
    }

    func save(item: ItemModel) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext

        let activityItemsEntity = NSEntityDescription.entity(forEntityName: "ActivatedItems",
                                                             in: managedContext)!
        let predefinedFeedbacksEntity = NSEntityDescription.entity(forEntityName: "PredefinedFeedbacks",
                                                             in: managedContext)!

        let items = NSManagedObject(entity: activityItemsEntity,
                                     insertInto: managedContext)
        items.setValue(item.name, forKeyPath: "name")

        let itemsPredefinedFeedbacks: [NSManagedObject] =
            item.predefinedFeedbacks.map({(predefinedFeedback: String) -> NSManagedObject in
            let predefinedFeedbacks = NSManagedObject(entity: predefinedFeedbacksEntity,
                                                      insertInto: managedContext)
            predefinedFeedbacks.setValue(predefinedFeedback, forKey: "name")
            return predefinedFeedbacks
        })
        items.setValue(NSSet(array: itemsPredefinedFeedbacks), forKey: "predefinedFeedbacks")

        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        header.text = currentCategory?.name
        feedbackService.getItems(categoryId: (currentCategory?.id)!).startWithValues({fetchedItems in self.itemList = fetchedItems; self.items.reloadData()})

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        button.backgroundColor = UIColor.red
        button.setTitle("Submit", for: UIControlState.normal)
        button.addTarget(self, action: #selector(activateItems), for: UIControlEvents.touchUpInside)
        items.tableFooterView = button
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "item")!
        cell.textLabel?.text = itemList[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
