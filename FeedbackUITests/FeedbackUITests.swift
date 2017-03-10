import XCTest
import Foundation

class FeedbackUITests: BaseTest {
    let menuItem="Curd"
    let menuImageName="curd"
    let feedbackType="watery"
    let expectedFeedbackLists=["good", "sour", "watery"]

    func testExample() {
        feedbackPage.selectFoodMenuList(menuName: menuItem)
        feedbackPage.verifyNumberOfFoodMenuDisplayed(numberOfFoodMenu: 2)
        feedbackPage.verifySelectedMenuItem(menuName: menuImageName, numberOfFeedbackList: 3,
                                            expectedFeedbackLists: expectedFeedbackLists)
        feedbackPage.submitFeedback(feedbackType: feedbackType)
        feedbackPage.verifyFeedbackSubmittedSuccessfully()
    }
}
