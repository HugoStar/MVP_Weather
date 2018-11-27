//
//  DetailViewControllerTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 27/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP

class DetailViewControllerTests: XCTestCase {
  
  var detailViewController: DetailViewController!
  var mockDetailViewPresentor: MockDetailViewPresentor!
  
  override func setUp() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
    detailViewController = viewController as? DetailViewController

    mockDetailViewPresentor = MockDetailViewPresentor()
    detailViewController.presentor = mockDetailViewPresentor
    
    detailViewController.loadViewIfNeeded()
  }
  
  override func tearDown() {}
  
  
  func test_ExistLabels() {
    
    XCTAssertNotNil(detailViewController.cityNameLabel)
    XCTAssertNotNil(detailViewController.tempLabel)
    XCTAssertNotNil(detailViewController.humidityLabel)
    XCTAssertNotNil(detailViewController.iconLabel)
    
  }
  
  func test_AddTextToLabelCityName() {
    
    
    
    
    detailViewController.loadCityNameLabelText("Sochi")
    XCTAssertEqual(detailViewController.cityNameLabel.text, "Sochi")
  }
  
  func test_AddTextToLabelTemp() {
    detailViewController.loadTempLabelText("20")
    XCTAssertEqual(detailViewController.tempLabel.text, "20")
  }
  
  func test_AddTextToLabelHumidity() {
    detailViewController.loadHumidityLabelText("70")
    XCTAssertEqual(detailViewController.humidityLabel.text, "70")
  }
  
  func test_AddTextToLabelIcon() {
    detailViewController.loadIconLabelText("0d")
    XCTAssertEqual(detailViewController.iconLabel.text, "0d")
  }

}

extension DetailViewControllerTests {
  class MockDetailViewPresentor: DetailViewPresentorType {
    var loadIsRun = false
    func load() {}
  }
}
