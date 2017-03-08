import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var categoriesList = ["breakfast", "lunch", "snacks"]
    @IBOutlet weak var categories: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        categories.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categories.dequeueReusableCell(withIdentifier: "category", for: indexPath)
            cell.textLabel?.text = categoriesList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "category", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let categoryViewController: CategoryViewController = segue.destination as! CategoryViewController
        if let indexPath = self.categories.indexPathForSelectedRow {
            categoryViewController.heading = categoriesList[indexPath.row]
        }
    }
}
