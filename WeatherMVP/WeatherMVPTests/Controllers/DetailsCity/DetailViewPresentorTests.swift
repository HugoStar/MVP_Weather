//
//  DetailViewPresentorTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 27/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP

class DetailViewPresentorTests: XCTestCase {
  
  var detailViewPresentor: DetailViewPresentor!
  var view: MockDetailViewController!
  
  
  override func setUp() {
    
    let city = City(name: "Sochi", temperature: 20.3, humidity: 80, icon: "02n")
    view = MockDetailViewController()
    detailViewPresentor = DetailViewPresentor(city: city, view: view)
  }
  
  override func tearDown() {}
  
  
  
  func test_loadView() {
    detailViewPresentor.load()
    
    XCTAssertNotNil(view.loadCityName)
    XCTAssertNotNil(view.loadIcon)
    XCTAssertNotNil(view.loadTemp)
    XCTAssertNotNil(view.loadHumidity)
    
  }
  
}

extension DetailViewPresentorTests {
  
  class MockDetailViewController: DetailView {
    
    var loadCityName: String!
    var loadIcon: String!
    var loadTemp: String!
    var loadHumidity: String!
    
    
    func loadTempLabelText(_ temp: String) {
      loadTemp = temp
    }
    
    func loadHumidityLabelText(_ humidy: String) {
      loadHumidity = humidy
    }
    
    func loadIconLabelText(_ icon: String) {
      loadIcon = icon
    }
    
    func loadCityNameLabelText(_ cityName: String) {
      loadCityName = cityName
    }
    
    

    
    
    

    
    
    
  }
  
}
