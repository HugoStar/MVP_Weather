//
//  WeatherMVPUITests.swift
//  WeatherMVPUITests
//
//  Created by Мишустин Сергеевич on 27/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest

class WeatherMVPUITests: XCTestCase {
  
  
  var application: XCUIApplication!
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    application = XCUIApplication()
    application.launch()

  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    application.navigationBars["WeatherMVP.MainView"].buttons["Add"].tap()
    application.textFields["City"].tap()
    application.textFields["City"].typeText("London")
    
    let addcityButton = application.buttons["AddCity"]
    addcityButton.tap()
  }
  
}
