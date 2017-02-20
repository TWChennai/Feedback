import Foundation
class FeedbackModel: Equatable {
    var name: String
    init() {
        name = "Feedback123"
    }
    static func == (lhs: FeedbackModel, rhs: FeedbackModel) -> Bool {
        return lhs.name == rhs.name
    }
}
