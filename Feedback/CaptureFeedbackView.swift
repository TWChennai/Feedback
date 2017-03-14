import UIKit
import Toast_Swift
import CoreData

extension FeedbackView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // swiftlint:disable:next force_cast
        return getFeedbacks(item: currentItem).count
    }

    func getFeedbacks(item: NSManagedObject?) -> [String] {
        if item == nil {
            return []
        }
        // swiftlint:disable:next force_cast
        let predefinedFeedbackValues: [NSManagedObject] = ((currentItem?.value(forKey: "predefinedFeedbacks") as! NSSet).allObjects as![NSManagedObject])
        // swiftlint:disable:next force_cast
        return predefinedFeedbackValues.map({b in b.value(forKey: "name") as! String})
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeedbackCell")!
        // swiftlint:disable:next force_cast
        cell.textLabel?.text = getFeedbacks(item: currentItem)[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        // swiftlint:disable:next force_cast
        let feedback = getFeedbacks(item: currentItem!)[indexPath.row]
        // swiftlint:disable:next force_cast
        viewModel.addFeedback(itemName: currentItem?.value(forKey: "name") as! String, feedback: feedback).startWithCompleted {
            self.view.makeToast("Feedback submitted", duration: TimeInterval.abs(1), position: ToastPosition.bottom)
        }
    }

    func reloadFeedbackCaptureView(item: NSManagedObject) {
        // swiftlint:disable:next force_cast
        let itemName: String = item.value(forKey: "name") as! String
        itemImage.sd_setImage(with: URL(string: "\(S3_URL)\(itemName.lowercased()).jpg"))
        itemImage.image?.accessibilityLabel = itemName.lowercased()
        currentItem = item
        predefinedFeedback.reloadData()
    }

}
