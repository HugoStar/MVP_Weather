//
//  CityTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
import Unbox
@testable import WeatherMVP

class CityTests: XCTestCase {
  
  override func setUp() {}
  override func tearDown() {}
  
  func test_InitEmptyCity() {
    let city = City()
    XCTAssertTrue(existCityWithParams(name: "", temp: 0.0, humidity: 0, icon: "", baseCity: city))
  }
  
  func test_InitCityWithCustonParams() {
    let city = City(name: "Sochi", temperature: 20, humidity: 70, icon: "x")
    XCTAssertTrue(existCityWithParams(name: "Sochi", temp: 20, humidity: 70, icon: "x", baseCity: city))
  }
  
  func test_InitCityWithJson() {
    let resultCity = try? City(unboxer: Unboxer(dictionary: JSON_City.jsonCity))
    guard let city = resultCity else { XCTFail(); return }
    XCTAssertTrue(existCityWithParams(name: "London", temp: 280.32, humidity: 81, icon: "09d", baseCity: city))
  }
  
  //MARK: - Asserts
  private func existCityWithParams(name: String, temp: Double, humidity: Int, icon: String, baseCity: City) -> Bool {
    if baseCity.name != name {
      XCTFail("Name is incorrect")
      return false
    }
    if baseCity.temperature != temp {
      XCTFail("Temperature is incorrect")
      return false
    }
    if baseCity.humidity != humidity {
      XCTFail("Humidity is incorrect")
      return false
    }
    if baseCity.icon != icon {
      XCTFail("Icon is incorrect")
      return false
    }
    return true
  }
}
