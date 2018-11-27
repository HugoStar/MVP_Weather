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
  var testNavigationController: MockViewController!
  var featureCoordinator: FeatureCoordinator!
  
  override func setUp() {
    testNavigationController = MockViewController()
    featureCoordinator = FeatureCoordinator(navigationController: testNavigationController)
  }
  
  override func tearDown() {}
  
  
  func test_ShowMainScreen() {
    featureCoordinator.showMainScreen()
    XCTAssertEqual(testNavigationController.viewControllers.count, 1)
  }
  
  func test_ShowAddScreen() {
    featureCoordinator.showAddScreen(with: nil, andDelegate: nil)
    XCTAssertTrue(testNavigationController.mockViewControllers.first is AddCityViewController)
  }
  
  func test_backToViewController() {
    featureCoordinator.backToPreviousViewController()
    XCTAssertTrue(testNavigationController.backToPreviousViewController)
  }
  

  
  func test_ActivateMehtodStart() {
    featureCoordinator.start()
    XCTAssertTrue(testNavigationController.viewControllers.first! is MainViewController)
  }
  
}


extension FeatureCoordinatorTests {
  class MockViewController: UINavigationController {
    
    var backToPreviousViewController = false
    
    override func popViewController(animated: Bool) -> UIViewController? {
      backToPreviousViewController = true
      return nil
    }

    var mockViewControllers: [UIViewController] = []
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
      mockViewControllers.append(viewController)
    }
  }
}
