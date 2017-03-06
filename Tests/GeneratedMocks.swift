// MARK: - Mocks generated from file: Feedback/FeedbackService.swift at 2017-03-01 14:31:12 +0000


import Cuckoo
@testable import Feedback

import Alamofire
import AlamofireObjectMapper
import Foundation
import SwiftyJSON

class MockFeedbackService: FeedbackService, Cuckoo.Mock {
    typealias MocksType = FeedbackService
    typealias Stubbing = __StubbingProxy_FeedbackService
    typealias Verification = __VerificationProxy_FeedbackService
    let manager = Cuckoo.MockManager()
    
    private var observed: FeedbackService?
    
    func spy(on victim: FeedbackService) -> Self {
        observed = victim
        return self
    }
    
    override func getItems(onLoadedAllItems: @escaping ([ItemModel]) -> ()) {
        return manager.call("getItems(onLoadedAllItems: @escaping ([ItemModel]) -> ())", parameters: (onLoadedAllItems), original: observed.map { o in return { (onLoadedAllItems: @escaping ([ItemModel]) -> ()) in o.getItems(onLoadedAllItems: onLoadedAllItems) } })
    }
    
    override func addFeedback(item: ItemModel, feedback: String, onSuccess: @escaping () -> ()) {
        return manager.call("addFeedback(item: ItemModel, feedback: String, onSuccess: @escaping () -> ())", parameters: (item, feedback, onSuccess), original: observed.map { o in return { (item: ItemModel, feedback: String, onSuccess: @escaping () -> ()) in o.addFeedback(item: item, feedback: feedback, onSuccess: onSuccess) } })
    }
    
    struct __StubbingProxy_FeedbackService: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func getItems<M1: Cuckoo.Matchable>(onLoadedAllItems: M1) -> Cuckoo.StubNoReturnFunction<(([ItemModel]) -> ())> where M1.MatchedType == ([ItemModel]) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(([ItemModel]) -> ())>] = [wrap(matchable: onLoadedAllItems) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("getItems(onLoadedAllItems: @escaping ([ItemModel]) -> ())", parameterMatchers: matchers))
        }
        
        func addFeedback<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(item: M1, feedback: M2, onSuccess: M3) -> Cuckoo.StubNoReturnFunction<(ItemModel, String, () -> ())> where M1.MatchedType == ItemModel, M2.MatchedType == String, M3.MatchedType == () -> () {
            let matchers: [Cuckoo.ParameterMatcher<(ItemModel, String, () -> ())>] = [wrap(matchable: item) { $0.0 }, wrap(matchable: feedback) { $0.1 }, wrap(matchable: onSuccess) { $0.2 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("addFeedback(item: ItemModel, feedback: String, onSuccess: @escaping () -> ())", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_FeedbackService: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        @discardableResult
        func getItems<M1: Cuckoo.Matchable>(onLoadedAllItems: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == ([ItemModel]) -> () {
            let matchers: [Cuckoo.ParameterMatcher<(([ItemModel]) -> ())>] = [wrap(matchable: onLoadedAllItems) { $0 }]
            return manager.verify("getItems(onLoadedAllItems: @escaping ([ItemModel]) -> ())", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func addFeedback<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(item: M1, feedback: M2, onSuccess: M3) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == ItemModel, M2.MatchedType == String, M3.MatchedType == () -> () {
            let matchers: [Cuckoo.ParameterMatcher<(ItemModel, String, () -> ())>] = [wrap(matchable: item) { $0.0 }, wrap(matchable: feedback) { $0.1 }, wrap(matchable: onSuccess) { $0.2 }]
            return manager.verify("addFeedback(item: ItemModel, feedback: String, onSuccess: @escaping () -> ())", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class FeedbackServiceStub: FeedbackService {
    
    override func getItems(onLoadedAllItems: @escaping ([ItemModel]) -> ()) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func addFeedback(item: ItemModel, feedback: String, onSuccess: @escaping () -> ()) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}
