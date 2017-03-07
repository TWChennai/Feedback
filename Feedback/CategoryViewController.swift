import UIKit

class CategoryViewController: UIViewController {
    var heading: String?

    @IBOutlet weak var header: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        header.text = heading!
    }
}
