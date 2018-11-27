//
//  MainPresentorTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP

class MainPresentorTests: XCTestCase {
  
  var mainPresentor: MainPresentor!
  
  
  override func setUp() {
    let mockMainView = MockMainView()
    let mockDataManager = MockDataManager()
    
    mainPresentor = MainPresentor(dataManager: mockDataManager, view: mockMainView, delegate: nil)
    mainPresentor.updateData()
  }
  
  override func tearDown() {}
  
  
  func test_GetCountCities() {
    let countCities = mainPresentor.getCountCities()
    XCTAssertEqual(countCities, 3)
  }
  
  func test_GetCityAtIndex() {
    let city = mainPresentor.getCityAtIndex(2)
    XCTAssertEqual(city.name, "Peru")
  }
  
  func test_DeleteElementAtIndex() {
    let city = mainPresentor.deleteElementAtIndex(1)
    XCTAssertEqual(mainPresentor.cities.count, 2)
    let dataCities = mainPresentor.dataManager.loadCities()
    XCTAssertEqual(dataCities.count, 2)
    XCTAssertEqual(city.name, "London")
    XCTAssertEqual(dataCities[1].name, "Peru")
  }
  
}


extension MainPresentorTests {
  
  class MockMainView: MainView {
    
    var tableIsReoad = false
    
    func reloadTableView() {
      tableIsReoad = true
    }
  }
  
  private class MockDataManager: DataManagerType {
    private var mockArray: [City] = [
      City(name: "Sochi", temperature: 20.0, humidity: 70, icon: "x"),
      City(name: "London", temperature: 23.6, humidity: 50, icon: "sx"),
      City(name: "Peru", temperature: 10, humidity: 40, icon: "dc")
    ]
    
    func addCity(_ city: City) {
      mockArray = mockArray.filter { $0.name != city.name }
      mockArray.append(city)
    }
    func loadCities() -> [City] {
      return mockArray
    }
    func deleteCity(_ city: City) {
      mockArray = mockArray.filter { $0.name != city.name }
    }
    
  }
}
