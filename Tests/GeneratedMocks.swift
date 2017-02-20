// MARK: - Mocks generated from file: Feedback/FeedbackInteractor.swift at 2017-02-17 14:52:08 +0000


import Cuckoo
@testable import Feedback

import Foundation

class MockFeedbackInteractor: FeedbackInteractor, Cuckoo.Mock {
    typealias MocksType = FeedbackInteractor
    typealias Stubbing = __StubbingProxy_FeedbackInteractor
    typealias Verification = __VerificationProxy_FeedbackInteractor
    let manager = Cuckoo.MockManager()
    
    private var observed: FeedbackInteractor?
    
    func spy(on victim: FeedbackInteractor) -> Self {
        observed = victim
        return self
    }
    
    override var presenter: FeedbackPresenterProtocol? {
        get {
            return manager.getter("presenter", original: observed.map { o in return { () -> FeedbackPresenterProtocol? in o.presenter } })
        }
        set {
            manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
    }
    
    override func getFeedback() -> FeedbackModel {
        return manager.call("getFeedback() -> FeedbackModel", parameters: (), original: observed.map { o in return { () -> FeedbackModel in o.getFeedback() } })
    }
    
    struct __StubbingProxy_FeedbackInteractor: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<FeedbackPresenterProtocol?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "presenter")
        }
        
        func getFeedback() -> Cuckoo.StubFunction<(), FeedbackModel> {
            return Cuckoo.StubFunction(stub: manager.createStub("getFeedback() -> FeedbackModel", parameterMatchers: []))
        }
    }
    
    struct __VerificationProxy_FeedbackInteractor: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var presenter: Cuckoo.VerifyProperty<FeedbackPresenterProtocol?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getFeedback() -> Cuckoo.__DoNotUse<FeedbackModel> {
            return manager.verify("getFeedback() -> FeedbackModel", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

class FeedbackInteractorStub: FeedbackInteractor {
    
    override var presenter: FeedbackPresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (FeedbackPresenterProtocol?).self)
        }
        set {
        }
    }
    
    override func getFeedback() -> FeedbackModel {
        return DefaultValueRegistry.defaultValue(for: (FeedbackModel).self)
    }
}

// MARK: - Mocks generated from file: Feedback/FeedbackPresenter.swift at 2017-02-17 14:52:08 +0000


import Cuckoo
@testable import Feedback

import Foundation

class MockFeedbackPresenter: FeedbackPresenter, Cuckoo.Mock {
    typealias MocksType = FeedbackPresenter
    typealias Stubbing = __StubbingProxy_FeedbackPresenter
    typealias Verification = __VerificationProxy_FeedbackPresenter
    let manager = Cuckoo.MockManager()
    
    private var observed: FeedbackPresenter?
    
    func spy(on victim: FeedbackPresenter) -> Self {
        observed = victim
        return self
    }
    
    override var view: FeedbackViewProtocol? {
        get {
            return manager.getter("view", original: observed.map { o in return { () -> FeedbackViewProtocol? in o.view } })
        }
        set {
            manager.setter("view", value: newValue, original: observed != nil ? { self.observed?.view = $0 } : nil)
        }
    }
    
    override var interactor: FeedbackInteractorProtocol? {
        get {
            return manager.getter("interactor", original: observed.map { o in return { () -> FeedbackInteractorProtocol? in o.interactor } })
        }
        set {
            manager.setter("interactor", value: newValue, original: observed != nil ? { self.observed?.interactor = $0 } : nil)
        }
    }
    
    override var wireFrame: FeedbackWireFrameProtocol? {
        get {
            return manager.getter("wireFrame", original: observed.map { o in return { () -> FeedbackWireFrameProtocol? in o.wireFrame } })
        }
        set {
            manager.setter("wireFrame", value: newValue, original: observed != nil ? { self.observed?.wireFrame = $0 } : nil)
        }
    }
    
    override var feedback: FeedbackModel? {
        get {
            return manager.getter("feedback", original: observed.map { o in return { () -> FeedbackModel? in o.feedback } })
        }
        set {
            manager.setter("feedback", value: newValue, original: observed != nil ? { self.observed?.feedback = $0 } : nil)
        }
    }
    
    override func onViewDidLoad() {
        return manager.call("onViewDidLoad()", parameters: (), original: observed.map { o in return { () in o.onViewDidLoad() } })
    }
    
    struct __StubbingProxy_FeedbackPresenter: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var view: Cuckoo.ToBeStubbedProperty<FeedbackViewProtocol?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "view")
        }
        
        var interactor: Cuckoo.ToBeStubbedProperty<FeedbackInteractorProtocol?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "interactor")
        }
        
        var wireFrame: Cuckoo.ToBeStubbedProperty<FeedbackWireFrameProtocol?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "wireFrame")
        }
        
        var feedback: Cuckoo.ToBeStubbedProperty<FeedbackModel?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "feedback")
        }
        
        func onViewDidLoad() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("onViewDidLoad()", parameterMatchers: []))
        }
    }
    
    struct __VerificationProxy_FeedbackPresenter: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var view: Cuckoo.VerifyProperty<FeedbackViewProtocol?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var interactor: Cuckoo.VerifyProperty<FeedbackInteractorProtocol?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "interactor", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var wireFrame: Cuckoo.VerifyProperty<FeedbackWireFrameProtocol?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "wireFrame", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var feedback: Cuckoo.VerifyProperty<FeedbackModel?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "feedback", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func onViewDidLoad() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("onViewDidLoad()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

class FeedbackPresenterStub: FeedbackPresenter {
    
    override var view: FeedbackViewProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (FeedbackViewProtocol?).self)
        }
        set {
        }
    }
    
    override var interactor: FeedbackInteractorProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (FeedbackInteractorProtocol?).self)
        }
        set {
        }
    }
    
    override var wireFrame: FeedbackWireFrameProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (FeedbackWireFrameProtocol?).self)
        }
        set {
        }
    }
    
    override var feedback: FeedbackModel? {
        get {
            return DefaultValueRegistry.defaultValue(for: (FeedbackModel?).self)
        }
        set {
        }
    }
    
    override func onViewDidLoad() {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}

// MARK: - Mocks generated from file: Feedback/FeedbackView.swift at 2017-02-17 14:52:08 +0000


import Cuckoo
@testable import Feedback

import UIKit

class MockFeedbackView: FeedbackView, Cuckoo.Mock {
    typealias MocksType = FeedbackView
    typealias Stubbing = __StubbingProxy_FeedbackView
    typealias Verification = __VerificationProxy_FeedbackView
    let manager = Cuckoo.MockManager()
    
    private var observed: FeedbackView?
    
    func spy(on victim: FeedbackView) -> Self {
        observed = victim
        return self
    }
    
    override var presenter: FeedbackPresenterProtocol? {
        get {
            return manager.getter("presenter", original: observed.map { o in return { () -> FeedbackPresenterProtocol? in o.presenter } })
        }
        set {
            manager.setter("presenter", value: newValue, original: observed != nil ? { self.observed?.presenter = $0 } : nil)
        }
    }
    
    override var titleText: UILabel! {
        get {
            return manager.getter("titleText", original: observed.map { o in return { () -> UILabel! in o.titleText } })
        }
        set {
            manager.setter("titleText", value: newValue, original: observed != nil ? { self.observed?.titleText = $0 } : nil)
        }
    }
    
    
    override func showFeedback(feedback: FeedbackModel) {
        return manager.call("showFeedback(feedback: FeedbackModel)", parameters: (feedback), original: observed.map { o in return { (feedback: FeedbackModel) in o.showFeedback(feedback: feedback) } })
    }
    
    override func viewDidLoad() {
        return manager.call("viewDidLoad()", parameters: (), original: observed.map { o in return { () in o.viewDidLoad() } })
    }
    
    override func didReceiveMemoryWarning() {
        return manager.call("didReceiveMemoryWarning()", parameters: (), original: observed.map { o in return { () in o.didReceiveMemoryWarning() } })
    }
    
    struct __StubbingProxy_FeedbackView: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var presenter: Cuckoo.ToBeStubbedProperty<FeedbackPresenterProtocol?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "presenter")
        }
        
        var titleText: Cuckoo.ToBeStubbedProperty<UILabel?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "titleText")
        }
        
        var text1: Cuckoo.ToBeStubbedProperty<UILabel?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "text1")
        }
        
        func showFeedback<M1: Cuckoo.Matchable>(feedback: M1) -> Cuckoo.StubNoReturnFunction<(FeedbackModel)> where M1.MatchedType == FeedbackModel {
            let matchers: [Cuckoo.ParameterMatcher<(FeedbackModel)>] = [wrap(matchable: feedback) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("showFeedback(feedback: FeedbackModel)", parameterMatchers: matchers))
        }
        
        func viewDidLoad() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("viewDidLoad()", parameterMatchers: []))
        }
        
        func didReceiveMemoryWarning() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("didReceiveMemoryWarning()", parameterMatchers: []))
        }
    }
    
    struct __VerificationProxy_FeedbackView: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var presenter: Cuckoo.VerifyProperty<FeedbackPresenterProtocol?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var titleText: Cuckoo.VerifyProperty<UILabel?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "titleText", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var text1: Cuckoo.VerifyProperty<UILabel?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "text1", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func showFeedback<M1: Cuckoo.Matchable>(feedback: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == FeedbackModel {
            let matchers: [Cuckoo.ParameterMatcher<(FeedbackModel)>] = [wrap(matchable: feedback) { $0 }]
            return manager.verify("showFeedback(feedback: FeedbackModel)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func viewDidLoad() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("viewDidLoad()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func didReceiveMemoryWarning() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("didReceiveMemoryWarning()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

class FeedbackViewStub: FeedbackView {
    
    override var presenter: FeedbackPresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (FeedbackPresenterProtocol?).self)
        }
        set {
        }
    }
    
    override var titleText: UILabel! {
        get {
            return DefaultValueRegistry.defaultValue(for: (UILabel!).self)
        }
        set {
        }
    }
    
    override func showFeedback(feedback: FeedbackModel) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func viewDidLoad() {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func didReceiveMemoryWarning() {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}
