//
//  FeedbackPage.swift
//  Feedback
//
//  Created by Marimuthu on 01/Mar/17.
//  Copyright © 2017 Thoughtworks. All rights reserved.
//

import Foundation
import XCTest

public class FeedbackPage:BasePage
{
    
    let application=BasePage.app
    
    let foodMenuLists = app.collectionViews.cells
    let feedbackLists = app.tables.cells.staticTexts
    let feedbackSubmittedStaticText = app.staticTexts["Feedback submitted"]
    
    
    func selectFoodMenuList(menuName: String)
    {
        let firstFoodItem=foodMenuLists.element(boundBy: 1)
        XCTestCase().waitForElementToAppear(element: firstFoodItem)
        firstFoodItem.swipeLeft()
        foodMenuLists.containing(.staticText, identifier:menuName).element.tap()
        
    }
    
    func submitFeedback(feedbackType: String)
    {
        feedbackLists.containing(.staticText, identifier:feedbackType).element.tap()
        
    }

    func verifyNumberOfFoodMenuDisplayed(numberOfFoodMenu: UInt)
    {
        XCTestCase().waitForElementToAppear(element: foodMenuLists.element(boundBy: 1))
        XCTAssertEqual(foodMenuLists.count,numberOfFoodMenu,"verify number of food menu list displayed")
    }
    
    func verifySelectedMenuItem(menuName: String,numberOfFeedbackList: UInt,expectedFeedbackLists: Array<String>)
    {
        XCTAssert(application.images[menuName].exists)
        XCTAssertEqual(feedbackLists.count,numberOfFeedbackList,"verify number of feeback list displayed")
        XCTAssert(getActualFeedbackLists() == expectedFeedbackLists)
        
    }
    
    func verifyFeedbackSubmittedSuccessfully()
    {
        XCTestCase().waitForElementToAppear(element: feedbackSubmittedStaticText)
        XCTAssert(feedbackSubmittedStaticText.exists)
        
    }
    
    private func getActualFeedbackLists() -> Array<String>
    {
        var actualFeedbackLists = [String]()
        
        for i in 0...(feedbackLists.count-1) {
            actualFeedbackLists.append(feedbackLists.element(boundBy: i).label)
        }
        return actualFeedbackLists
    }
    
    
    
}
