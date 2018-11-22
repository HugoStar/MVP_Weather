//
//  MainViewControllerTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP

class MainViewControllerTests: XCTestCase {
  
  
  var mainViewController: MainViewController!
  
  
  override func setUp() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
    mainViewController = viewController as? MainViewController
    mainViewController.loadViewIfNeeded()
    
    
    
  }

  override func tearDown() {}
  
  func test_TebleViewIsNotNill() {
    XCTAssertNotNil(mainViewController.tableView)
  }

}
