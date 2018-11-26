//
//  AddCityViewControllerTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 26/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP

class AddCityViewControllerTests: XCTestCase {
  
  var addCityViewController: AddCityViewController!
  var mockPresentor: MockAddCityPresentor!
  
  override func setUp() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "AddCityViewController")
    addCityViewController = viewController as? AddCityViewController
    addCityViewController.loadViewIfNeeded()
    
    mockPresentor = MockAddCityPresentor()
    addCityViewController.presentor = mockPresentor
    
  }
  
  override func tearDown() {}
  
  func test_existInpitNameField() {
    XCTAssertNotNil(addCityViewController.inputFieldName)
  }
  
  
}

extension AddCityViewControllerTests {
  
  class MockAddCityPresentor: AddCityPresentorType {
    var cities: [City] = []
    
    func addCityWithName (_ cityName: String) {
      let city = City(name: "Sochi", temperature: 20, humidity: 70, icon: "x")
      cities.append(city)
    }
  }
}
