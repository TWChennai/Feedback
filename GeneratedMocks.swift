// MARK: - Mocks generated from file: Feedback/FeedbackService.swift at 2017-03-17 09:09:01 +0000


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
    
    override func getItems(categoryId: String) -> SignalProducer<[ItemModel], NoError> {
        return manager.call("getItems(categoryId: String) -> SignalProducer<[ItemModel], NoError>", parameters: (categoryId), original: observed.map { o in return { (categoryId: String) -> SignalProducer<[ItemModel], NoError> in o.getItems(categoryId: categoryId) } })
    }
    
    override func getCategories() -> SignalProducer<[CategoryModel], NoError> {
        return manager.call("getCategories() -> SignalProducer<[CategoryModel], NoError>", parameters: (), original: observed.map { o in return { () -> SignalProducer<[CategoryModel], NoError> in o.getCategories() } })
    }
    
    override func addFeedback(item: ItemModel, feedback: String) -> SignalProducer<(), NoError> {
        return manager.call("addFeedback(item: ItemModel, feedback: String) -> SignalProducer<(), NoError>", parameters: (item, feedback), original: observed.map { o in return { (item: ItemModel, feedback: String) -> SignalProducer<(), NoError> in o.addFeedback(item: item, feedback: feedback) } })
    }
    
    struct __StubbingProxy_FeedbackService: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        func getItems<M1: Cuckoo.Matchable>(categoryId: M1) -> Cuckoo.StubFunction<(String), SignalProducer<[ItemModel], NoError>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: categoryId) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("getItems(categoryId: String) -> SignalProducer<[ItemModel], NoError>", parameterMatchers: matchers))
        }
        
        func getCategories() -> Cuckoo.StubFunction<(), SignalProducer<[CategoryModel], NoError>> {
            return Cuckoo.StubFunction(stub: manager.createStub("getCategories() -> SignalProducer<[CategoryModel], NoError>", parameterMatchers: []))
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
        func getItems<M1: Cuckoo.Matchable>(categoryId: M1) -> Cuckoo.__DoNotUse<SignalProducer<[ItemModel], NoError>> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: categoryId) { $0 }]
            return manager.verify("getItems(categoryId: String) -> SignalProducer<[ItemModel], NoError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getCategories() -> Cuckoo.__DoNotUse<SignalProducer<[CategoryModel], NoError>> {
            return manager.verify("getCategories() -> SignalProducer<[CategoryModel], NoError>", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func addFeedback<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(item: M1, feedback: M2) -> Cuckoo.__DoNotUse<SignalProducer<(), NoError>> where M1.MatchedType == ItemModel, M2.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(ItemModel, String)>] = [wrap(matchable: item) { $0.0 }, wrap(matchable: feedback) { $0.1 }]
            return manager.verify("addFeedback(item: ItemModel, feedback: String) -> SignalProducer<(), NoError>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class FeedbackServiceStub: FeedbackService {
    
    override func getItems(categoryId: String) -> SignalProducer<[ItemModel], NoError> {
        return DefaultValueRegistry.defaultValue(for: (SignalProducer<[ItemModel], NoError>).self)
    }
    
    override func getCategories() -> SignalProducer<[CategoryModel], NoError> {
        return DefaultValueRegistry.defaultValue(for: (SignalProducer<[CategoryModel], NoError>).self)
    }
    
    override func addFeedback(item: ItemModel, feedback: String) -> SignalProducer<(), NoError> {
        return DefaultValueRegistry.defaultValue(for: (SignalProducer<(), NoError>).self)
    }
}
