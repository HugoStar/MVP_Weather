//
//  DataManagerClientTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP
import RealmSwift

class DataManagerTests: XCTestCase {
  
  var dataManager: DataManager!
  
  override func setUp() {
    dataManager = DataManager()
    let realm = RealmProvider.realm()
    try! realm.write { () -> Void in
      realm.deleteAll()
    }
  }
  override func tearDown() {}
  
  func test_addElementToDataBase() {
    let city = City()
    dataManager.addCity(city)
    let cities = dataManager.loadCities()
    
    XCTAssertEqual(cities.count, 1)
  }
  
  func test_DeleteElementFromDataBase() {
    
    let city1 = City()
    city1.name = "Foo"
    let city2 = City()
    city2.name = "Bar"
    
    dataManager.addCity(city1)
    dataManager.addCity(city2)
    
    var cities = dataManager.loadCities()
    XCTAssertEqual(cities.count, 2)
    
    dataManager.deleteCity(city1)
    cities = dataManager.loadCities()
    
    XCTAssertEqual(cities.count, 1)
  }
  
  func test_updateElementFromDataBase() {
    let city1 = City()
    let city2 = City()
    
    dataManager.addCity(city1)
    dataManager.addCity(city2)
    let cities = dataManager.loadCities()
    
    XCTAssertEqual(cities.count, 1)
  }
  
  func test_UpdateElementFromDatabase() {
    let city1 = City(name: "Sochi", temperature: 28.0, humidity: 70, icon: "x")
    let city2 = City(name: "Sochi", temperature: 40.0, humidity: 75, icon: "dx")
    
    dataManager.addCity(city1)
    dataManager.addCity(city2)
    
    let city = dataManager.loadCities().first!
    
    XCTAssertTrue(city.temperature == 40.0, "temperature isn't change")
    XCTAssertTrue(city.humidity == 75, "humidity isn't change")
    XCTAssertTrue(city.icon == "dx", "icon isn't change")
  }
}
