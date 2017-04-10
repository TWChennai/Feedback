# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Feedback' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Feedback
    pod 'Alamofire', '~> 4.3'
    pod 'SwiftyJSON'
    pod 'AlamofireObjectMapper', '~> 4.0'
    pod 'MGSwipeTableCell'
    pod 'SDWebImage', '~> 4.0.0'
    pod 'Toast-Swift', '~> 2.0.0'
    pod 'ReactiveCocoa', '~> 5.0.0'
    pod 'SwiftLint'
  
  target 'FeedbackTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble', '~> 5.0'
    pod 'Cuckoo'
    pod 'OHHTTPStubs'
    pod 'OHHTTPStubs/Swift'
    pod 'KIF'
    pod 'KIF/IdentifierTests'
    pod 'EarlGrey'
    pod 'PactConsumerSwift', :git => 'https://github.com/DiUS/pact-consumer-swift', :branch => 'master'
  end

  target 'FeedbackUITests' do
    inherit! :search_paths
    pod 'SwiftMonkey'
  end
  
end
