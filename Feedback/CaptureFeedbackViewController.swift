import UIKit
import Toast_Swift

extension FeedbackView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentItem.predefinedFeedbacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "FeedbackCell")!
        cell.textLabel?.text = currentItem.predefinedFeedbacks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let feedback = currentItem.predefinedFeedbacks[indexPath.row]
        viewModel.addFeedback(item: currentItem, feedback: feedback, onSuccess: successfullySubmitted)
    }
    
    func reloadFeedbackCaptureView(item: ItemModel) {
        let itemName: String = item.name!
        itemImage.sd_setImage(with: URL(string: "\(S3_URL)\(itemName.lowercased()).jpg"))
        itemImage.image?.accessibilityLabel = itemName.lowercased()
        currentItem = item
        predefinedFeedback.reloadData()
    }
    
    func successfullySubmitted() {
        self.view.makeToast("Feedback submitted", duration: TimeInterval.abs(1), position: ToastPosition.bottom)
    }

}
