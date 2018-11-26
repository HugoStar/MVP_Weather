//
//  AddCityPresentor.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 26/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP

class AddCityPresentorTests: XCTestCase {

  var addCityPresentor: AddCityPresentor!

  override func setUp() {
    
    let mockAddView = MockAddView()
    let mockDataManager = MockDataManager()
    let mockApiManager = MockAPI_Manager(with: MockNetManager())
    
    addCityPresentor = AddCityPresentor(dataManager: mockDataManager, apiManager: mockApiManager, view: mockAddView, delegate: nil)
    
  }
  
  override func tearDown() {}
  
  func test_AddCityWithName() {
    addCityPresentor.addCityWithName("London")
    let cities = addCityPresentor.dataManager.loadCities()
    XCTAssertEqual(cities.count, 1)
    XCTAssertEqual(cities[0].name, "London")
  }
  
}


extension AddCityPresentorTests {
  
  class MockAddView: AddCityView {
    
  }
  
  class MockDataManager: DataManagerType {
    private var mockArray: [City] = []
    
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
  
  class MockAPI_Manager: API_ManagerType {
    
    let netManager: NetClientType
    
    required init(with netClient: NetClientType) {
      self.netManager = netClient
    }
    
    func addCityWithName(_ name: String, callBack: @escaping NETResponce) {
      let responce = JSON_City.jsonCity
      callBack(responce, nil)
    }
  }
  
  class MockNetManager: NetClientType {
    func getDataWithURL(_ url: String, response: @escaping NETResponce) {}
  }
}
