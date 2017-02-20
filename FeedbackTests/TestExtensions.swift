@testable import Feedback
import Foundation
extension FeedbackModel: Equatable {
    public static func ==(lhs: FeedbackModel, rhs: FeedbackModel) -> Bool {
        return lhs.name == rhs.name
    }
}
