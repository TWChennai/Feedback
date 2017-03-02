import Foundation

@testable import Feedback

extension ItemModel {
    
    static func ==(lhs: ItemModel, rhs: ItemModel) -> Bool {
        return lhs.name == rhs.name && lhs.predefinedFeedbacks == rhs.predefinedFeedbacks
    }
}
