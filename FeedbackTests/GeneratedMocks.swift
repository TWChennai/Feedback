// MARK: - Mocks generated from file: Feedback/FeedbackView.swift at 2017-02-22 10:05:48 +0000


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
    
    override var viewModel: FeedbackViewModel {
        get {
            return manager.getter("viewModel", original: observed.map { o in return { () -> FeedbackViewModel in o.viewModel } })
        }
        set {
            manager.setter("viewModel", value: newValue, original: observed != nil ? { self.observed?.viewModel = $0 } : nil)
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
    
    override var collectionView: UICollectionView! {
        get {
            return manager.getter("collectionView", original: observed.map { o in return { () -> UICollectionView! in o.collectionView } })
        }
        set {
            manager.setter("collectionView", value: newValue, original: observed != nil ? { self.observed?.collectionView = $0 } : nil)
        }
    }
    
    override func viewDidLoad() {
        return manager.call("viewDidLoad()", parameters: (), original: observed.map { o in return { () in o.viewDidLoad() } })
    }
    
    override func didReceiveMemoryWarning() {
        return manager.call("didReceiveMemoryWarning()", parameters: (), original: observed.map { o in return { () in o.didReceiveMemoryWarning() } })
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.call("collectionView(_: UICollectionView, numberOfItemsInSection: Int) -> Int", parameters: (collectionView, section), original: observed.map { o in return { (collectionView: UICollectionView, section: Int) -> Int in o.collectionView(collectionView, numberOfItemsInSection: section) } })
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return manager.call("collectionView(_: UICollectionView, cellForItemAt: IndexPath) -> UICollectionViewCell", parameters: (collectionView, indexPath), original: observed.map { o in return { (collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell in o.collectionView(collectionView, cellForItemAt: indexPath) } })
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return manager.call("collectionView(_: UICollectionView, didSelectItemAt: IndexPath)", parameters: (collectionView, indexPath), original: observed.map { o in return { (collectionView: UICollectionView, indexPath: IndexPath) in o.collectionView(collectionView, didSelectItemAt: indexPath) } })
    }
    
    override func onLoadedAllItems(items: [ItemModel]) {
        return manager.call("onLoadedAllItems(items: [ItemModel])", parameters: (items), original: observed.map { o in return { (items: [ItemModel]) in o.onLoadedAllItems(items: items) } })
    }
    
    struct __StubbingProxy_FeedbackView: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var viewModel: Cuckoo.ToBeStubbedProperty<FeedbackViewModel> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "viewModel")
        }
        
        var titleText: Cuckoo.ToBeStubbedProperty<UILabel?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "titleText")
        }
        
        var collectionView: Cuckoo.ToBeStubbedProperty<UICollectionView?> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "collectionView")
        }
        
        func viewDidLoad() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("viewDidLoad()", parameterMatchers: []))
        }
        
        func didReceiveMemoryWarning() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("didReceiveMemoryWarning()", parameterMatchers: []))
        }
        
        func collectionView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ collectionView: M1, numberOfItemsInSection section: M2) -> Cuckoo.StubFunction<(UICollectionView, Int), Int> where M1.MatchedType == UICollectionView, M2.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(UICollectionView, Int)>] = [wrap(matchable: collectionView) { $0.0 }, wrap(matchable: section) { $0.1 }]
            return Cuckoo.StubFunction(stub: manager.createStub("collectionView(_: UICollectionView, numberOfItemsInSection: Int) -> Int", parameterMatchers: matchers))
        }
        
        func collectionView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ collectionView: M1, cellForItemAt indexPath: M2) -> Cuckoo.StubFunction<(UICollectionView, IndexPath), UICollectionViewCell> where M1.MatchedType == UICollectionView, M2.MatchedType == IndexPath {
            let matchers: [Cuckoo.ParameterMatcher<(UICollectionView, IndexPath)>] = [wrap(matchable: collectionView) { $0.0 }, wrap(matchable: indexPath) { $0.1 }]
            return Cuckoo.StubFunction(stub: manager.createStub("collectionView(_: UICollectionView, cellForItemAt: IndexPath) -> UICollectionViewCell", parameterMatchers: matchers))
        }
        
        func collectionView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ collectionView: M1, didSelectItemAt indexPath: M2) -> Cuckoo.StubNoReturnFunction<(UICollectionView, IndexPath)> where M1.MatchedType == UICollectionView, M2.MatchedType == IndexPath {
            let matchers: [Cuckoo.ParameterMatcher<(UICollectionView, IndexPath)>] = [wrap(matchable: collectionView) { $0.0 }, wrap(matchable: indexPath) { $0.1 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("collectionView(_: UICollectionView, didSelectItemAt: IndexPath)", parameterMatchers: matchers))
        }
        
        func onLoadedAllItems<M1: Cuckoo.Matchable>(items: M1) -> Cuckoo.StubNoReturnFunction<([ItemModel])> where M1.MatchedType == [ItemModel] {
            let matchers: [Cuckoo.ParameterMatcher<([ItemModel])>] = [wrap(matchable: items) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("onLoadedAllItems(items: [ItemModel])", parameterMatchers: matchers))
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
        
        var viewModel: Cuckoo.VerifyProperty<FeedbackViewModel> {
            return Cuckoo.VerifyProperty(manager: manager, name: "viewModel", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var titleText: Cuckoo.VerifyProperty<UILabel?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "titleText", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        var collectionView: Cuckoo.VerifyProperty<UICollectionView?> {
            return Cuckoo.VerifyProperty(manager: manager, name: "collectionView", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func viewDidLoad() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("viewDidLoad()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func didReceiveMemoryWarning() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("didReceiveMemoryWarning()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func collectionView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ collectionView: M1, numberOfItemsInSection section: M2) -> Cuckoo.__DoNotUse<Int> where M1.MatchedType == UICollectionView, M2.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(UICollectionView, Int)>] = [wrap(matchable: collectionView) { $0.0 }, wrap(matchable: section) { $0.1 }]
            return manager.verify("collectionView(_: UICollectionView, numberOfItemsInSection: Int) -> Int", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func collectionView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ collectionView: M1, cellForItemAt indexPath: M2) -> Cuckoo.__DoNotUse<UICollectionViewCell> where M1.MatchedType == UICollectionView, M2.MatchedType == IndexPath {
            let matchers: [Cuckoo.ParameterMatcher<(UICollectionView, IndexPath)>] = [wrap(matchable: collectionView) { $0.0 }, wrap(matchable: indexPath) { $0.1 }]
            return manager.verify("collectionView(_: UICollectionView, cellForItemAt: IndexPath) -> UICollectionViewCell", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func collectionView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ collectionView: M1, didSelectItemAt indexPath: M2) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == UICollectionView, M2.MatchedType == IndexPath {
            let matchers: [Cuckoo.ParameterMatcher<(UICollectionView, IndexPath)>] = [wrap(matchable: collectionView) { $0.0 }, wrap(matchable: indexPath) { $0.1 }]
            return manager.verify("collectionView(_: UICollectionView, didSelectItemAt: IndexPath)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func onLoadedAllItems<M1: Cuckoo.Matchable>(items: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == [ItemModel] {
            let matchers: [Cuckoo.ParameterMatcher<([ItemModel])>] = [wrap(matchable: items) { $0 }]
            return manager.verify("onLoadedAllItems(items: [ItemModel])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class FeedbackViewStub: FeedbackView {
    
    override var viewModel: FeedbackViewModel {
        get {
            return DefaultValueRegistry.defaultValue(for: (FeedbackViewModel).self)
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
    
    override var collectionView: UICollectionView! {
        get {
            return DefaultValueRegistry.defaultValue(for: (UICollectionView!).self)
        }
        set {
        }
    }
    
    override func viewDidLoad() {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func didReceiveMemoryWarning() {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DefaultValueRegistry.defaultValue(for: (Int).self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return DefaultValueRegistry.defaultValue(for: (UICollectionViewCell).self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func onLoadedAllItems(items: [ItemModel]) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}
