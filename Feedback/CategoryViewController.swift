import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var currentCategory: CategoryModel?
    var itemList: [ItemModel] = []
    var feedbackService: FeedbackService = FeedbackService()
    var activatedItems: Array<ItemModel> = []

    @IBOutlet weak var header: UILabel!

    @IBOutlet weak var items: UITableView!

    func activateItems(_ sender: UIButton) {
        self.activatedItems = []
        let selectedRows: Array<IndexPath>? = self.items.indexPathsForSelectedRows
        selectedRows?.forEach({row in
                let cell = self.items.cellForRow(at: row)
                let itemName = cell?.textLabel?.text
                let itemIndex = self.itemList.index(where: {item in item.name == itemName})
                self.activatedItems.append(self.itemList[itemIndex!])
                self.items.deselectRow(at: row , animated: false)
                items.cellForRow(at: row)?.accessoryType = .none
            })
        print(self.activatedItems.count)
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
