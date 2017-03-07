import UIKit

class FoodCategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var categories = ["breakfast", "lunch", "snacks"]
    @IBOutlet weak var category: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        category.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = category.dequeueReusableCell(withIdentifier: "category", for: indexPath)
            cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "category", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let categoryViewController: CategoryViewController = segue.destination as! CategoryViewController
        if let indexPath = self.category.indexPathForSelectedRow {
            categoryViewController.heading = categories[indexPath.row]
        }
    }
}
