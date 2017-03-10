import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var currentCategory: CategoryModel?
    var itemList: [ItemModel] = []
    var feedbackService: FeedbackService = FeedbackService()

    @IBOutlet weak var header: UILabel!

    @IBOutlet weak var items: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        header.text = currentCategory?.name
        feedbackService.getItems(categoryId: (currentCategory?.id)!).startWithValues({fetchedItems in
            self.itemList = fetchedItems; self.items.reloadData()})
        items.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "item")!
        cell.accessoryType = .checkmark
        cell.textLabel?.text = itemList[indexPath.row].name
        return cell
    }
}
