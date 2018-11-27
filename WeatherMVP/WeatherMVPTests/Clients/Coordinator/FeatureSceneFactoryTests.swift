//
//  FeatureSceneFactoryTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 23/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP

class FeatureSceneFactoryTests: XCTestCase {
  
  var factory = FeatureSceneFactory.self

  override func setUp() {}
  
  override func tearDown() {}
  
  
  func test_MakeMainViewController() {
    let viewController = factory.makeMainController(delegate: nil)
    XCTAssertNotNil(viewController)
    XCTAssertNotNil(viewController.presentor)
  }
  
  func test_MakeAddCityViewController() {
    let viewController = factory.makeAddCityController()
    XCTAssertNotNil(viewController)
    XCTAssertNotNil(viewController.presentor)
  }
  
  func test_MakeDetailViewController() {
    let viewController = factory.makeDetailViewController(withCity: City())
    XCTAssertNotNil(viewController)
    XCTAssertNotNil(viewController.presentor)
  }
}
