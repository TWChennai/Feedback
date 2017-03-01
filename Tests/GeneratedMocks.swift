// MARK: - Mocks generated from file: Feedback/FeedbackViewModel.swift at 2017-03-01 12:25:31 +0000


import Cuckoo
@testable import Feedback

import Alamofire
import AlamofireObjectMapper
import Foundation
import SwiftyJSON

class MockFeedbackViewModel: FeedbackViewModel, Cuckoo.Mock {
    typealias MocksType = FeedbackViewModel
    typealias Stubbing = __StubbingProxy_FeedbackViewModel
    typealias Verification = __VerificationProxy_FeedbackViewModel
    let manager = Cuckoo.MockManager()
    
    private var observed: FeedbackViewModel?
    
    func spy(on victim: FeedbackViewModel) -> Self {
        observed = victim
        return self
    }
    
    override var model: FeedbackModel {
        get {
            return manager.getter("model", original: observed.map { o in return { () -> FeedbackModel in o.model } })
        }
        set {
            manager.setter("model", value: newValue, original: observed != nil ? { self.observed?.model = $0 } : nil)
        }
    }
    
    override func getItems(onLoadedAllItems: @escaping ([ItemModel]) -> ()) {
        return manager.call("getItems(onLoadedAllItems: @escaping ([ItemModel]) -> ())", parameters: (onLoadedAllItems), original: observed.map { o in return { (onLoadedAllItems: @escaping ([ItemModel]) -> ()) in o.getItems(onLoadedAllItems: onLoadedAllItems) } })
    }
    
    override func addFeedback(item: ItemModel, feedback: String, onSuccess: @escaping () -> ()) {
        return manager.call("addFeedback(item: ItemModel, feedback: String, onSuccess: @escaping () -> ())", parameters: (item, feedback, onSuccess), original: observed.map { o in return { (item: ItemModel, feedback: String, onSuccess: @escaping () -> ()) in o.addFeedback(item: item, feedback: feedback, onSuccess: onSuccess) } })
    }
    
    struct __StubbingProxy_FeedbackViewModel: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var model: Cuckoo.ToBeStubbedProperty<FeedbackModel> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "model")
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
    
    struct __VerificationProxy_FeedbackViewModel: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var model: Cuckoo.VerifyProperty<FeedbackModel> {
            return Cuckoo.VerifyProperty(manager: manager, name: "model", callMatcher: callMatcher, sourceLocation: sourceLocation)
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

class FeedbackViewModelStub: FeedbackViewModel {
    
    override var model: FeedbackModel {
        get {
            return DefaultValueRegistry.defaultValue(for: (FeedbackModel).self)
        }
        set {
        }
    }
    
    override func getItems(onLoadedAllItems: @escaping ([ItemModel]) -> ()) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func addFeedback(item: ItemModel, feedback: String, onSuccess: @escaping () -> ()) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}
