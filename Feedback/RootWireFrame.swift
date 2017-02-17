import UIKit
import Foundation

class RootWireFrame {
    var feedbackWireFrame: FeedbackWireFrame = FeedbackWireFrame();
    var window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    func initFeedbackWireFrame() {
        feedbackWireFrame.presentFeedbackView(window: self.window)
    }
}
