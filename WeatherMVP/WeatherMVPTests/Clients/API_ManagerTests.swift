//
//  API_ManagerTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
import Alamofire
@testable import WeatherMVP

class API_ManagerTests: XCTestCase {

  var apiManager: API_Manager!
  
  override func setUp() {
    let server = NetClient()
    apiManager = API_Manager(with: server)
  }
  override func tearDown() {}
  
  func test_GetCityFromServer() {
    let geocoderAnswered = expectation(description: "GetCity")
    apiManager.addCityWithName("Sochi") { responce, error in
      XCTAssertNotNil(responce)
      geocoderAnswered.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
}

