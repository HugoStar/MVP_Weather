//
//  FeatureCoordinatorTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 23/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP

class FeatureCoordinatorTests: XCTestCase {
  var testNavigationController: UINavigationController!
  var featureCoordinator: FeatureCoordinator!
  
  override func setUp() {
    testNavigationController = UINavigationController()
    featureCoordinator = FeatureCoordinator(navigationController: testNavigationController)
  }
  
  override func tearDown() {}
  
  
  func test_ShowMainScreen() {
    featureCoordinator.showMainScreen()
    XCTAssertEqual(testNavigationController.viewControllers.count, 1)
  }
  
  func test_ActivateMehtodStart() {
    featureCoordinator.start()
    XCTAssertTrue(testNavigationController.viewControllers.first! is MainViewController)
  }
  
}
