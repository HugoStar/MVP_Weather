//
//  AppCoordinatorTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 23/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP

class AppCoordinatorTests: XCTestCase {
  var tempWindow: UIWindow!
  var tempNavigationController: UINavigationController!
  var appCoordinator: AppCoordinator!
  
  override func setUp() {
    tempWindow = UIWindow()
    tempNavigationController = UINavigationController()
    
    appCoordinator = AppCoordinator(window: tempWindow, navigationController: tempNavigationController)
  }
  
  override func tearDown() {}
  
  
  func test_RootViewControllerForWindowIsNotNill() {
    XCTAssertNotNil(tempWindow.rootViewController)
  }
  
  func test_ExistRootViewControllerForWindow() {
    let rootViewController = tempWindow.rootViewController!
    XCTAssertEqual(rootViewController, tempNavigationController)
  }
  
  func test_ExistStartCoordinator() {
    let startCoordinator = appCoordinator.starterCoordinator
     XCTAssertNotNil(startCoordinator)
  }
  
  func test_ActionStartIsRunning() {
    let mockStarterCoordinator = MockFeatureCoordinator()
    appCoordinator.starterCoordinator = mockStarterCoordinator
    appCoordinator.start()
    XCTAssertTrue(mockStarterCoordinator.startIsRunning)
  }
  
}

extension AppCoordinatorTests {
  class MockFeatureCoordinator: FeatureCoordinator {
    var startIsRunning = false
    override func start() {
      startIsRunning = true
    }
  }
}
