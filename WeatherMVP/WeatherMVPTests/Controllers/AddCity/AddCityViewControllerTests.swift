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
  
  func test_ActionButtonAddCity() {
    guard let button = addCityViewController.buttonAddCity else { XCTFail(); return }
    button.sendActions(for: .touchUpInside)
    XCTAssertTrue(mockPresentor.cityIsAdd)
  }
  
  func test_HideKeyBoard() {
    let shouldReturn = addCityViewController.textFieldShouldReturn(addCityViewController.inputFieldName)
    XCTAssertTrue(shouldReturn)
  }
  

  
  
}

extension AddCityViewControllerTests {

  class MockAddCityPresentor: AddCityPresentorType {
    func addCityWithName(_ cityName: String, callback: @escaping EmptyClosure) {
      
    }
    
    func backPrevious() {
      
    }
    
    var isHideControlle = false
    var cityIsAdd = false

    func addCityWithName (_ cityName: String) {
      cityIsAdd = true
    }
    
    func actionForCancelButton() {
      isHideControlle = true
    }
  }
}
