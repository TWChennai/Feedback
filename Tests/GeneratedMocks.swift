// MARK: - Mocks generated from file: Feedback/FeedbackService.swift at 2017-03-08 13:58:36 +0000


import Cuckoo
@testable import Feedback

import Alamofire
import AlamofireObjectMapper
import Foundation
import ReactiveSwift
import SwiftyJSON
import enum Result.NoError

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
    
    override func getItems() -> SignalProducer<[ItemModel], NoError> {
        return manager.call("getItems() -> SignalProducer<[ItemModel], NoError>", parameters: (), original: observed.map { o in return { () -> SignalProducer<[ItemModel], NoError> in o.getItems() } })
    }
    
    override func addFeedback(item: ItemModel, feedback: String) -> SignalProducer<(), NoError> {
        return manager.call("addFeedback(item: ItemModel, feedback: String) -> SignalProducer<(), NoError>", parameters: (item, feedback), original: observed.map { o in return { (item: ItemModel, feedback: String) -> SignalProducer<(), NoError> in o.addFeedback(item: item, feedback: feedback) } })
    }
    
    struct __StubbingProxy_FeedbackService: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func getItems() -> Cuckoo.StubFunction<(), SignalProducer<[ItemModel], NoError>> {
            return Cuckoo.StubFunction(stub: manager.createStub("getItems() -> SignalProducer<[ItemModel], NoError>", parameterMatchers: []))
        }
        
        func addFeedback<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(item: M1, feedback: M2) -> Cuckoo.StubFunction<(ItemModel, String), SignalProducer<(), NoError>> where M1.MatchedType == ItemModel, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(ItemModel, String)>] = [wrap(matchable: item) { $0.0 }, wrap(matchable: feedback) { $0.1 }]
            return Cuckoo.StubFunction(stub: manager.createStub("addFeedback(item: ItemModel, feedback: String) -> SignalProducer<(), NoError>", parameterMatchers: matchers))
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
        func getItems() -> Cuckoo.__DoNotUse<SignalProducer<[ItemModel], NoError>> {
            return manager.verify("getItems() -> SignalProducer<[ItemModel], NoError>", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func addFeedback<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(item: M1, feedback: M2) -> Cuckoo.__DoNotUse<SignalProducer<(), NoError>> where M1.MatchedType == ItemModel, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(ItemModel, String)>] = [wrap(matchable: item) { $0.0 }, wrap(matchable: feedback) { $0.1 }]
            return manager.verify("addFeedback(item: ItemModel, feedback: String) -> SignalProducer<(), NoError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class FeedbackServiceStub: FeedbackService {
    
    override func getItems() -> SignalProducer<[ItemModel], NoError> {
        return DefaultValueRegistry.defaultValue(for: (SignalProducer<[ItemModel], NoError>).self)
    }
    
    override func addFeedback(item: ItemModel, feedback: String) -> SignalProducer<(), NoError> {
        return DefaultValueRegistry.defaultValue(for: (SignalProducer<(), NoError>).self)
    }
}
