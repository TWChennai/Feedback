import UIKit
import ReactiveSwift

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var categoriesList: [CategoryModel] = []
    var feedbackService: FeedbackService = FeedbackService()
    @IBOutlet weak var categories: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        feedbackService
            .getCategories()
            .startWithValues({ categoriesList in
                self.categoriesList = categoriesList
                self.categories.reloadData()
            })
        categories.tableFooterView = UIView()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categories.dequeueReusableCell(withIdentifier: "category", for: indexPath)
            cell.textLabel?.text = categoriesList[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "category", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // swiftlint:disable:next force_cast
        let categoryViewController: CategoryViewController = segue.destination as! CategoryViewController
        if let indexPath = self.categories.indexPathForSelectedRow {
            categoryViewController.currentCategory = categoriesList[indexPath.row]
        }
    }
}
