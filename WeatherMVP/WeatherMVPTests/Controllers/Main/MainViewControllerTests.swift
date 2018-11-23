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
  var mockPresentor: MockMainPresentor!
  var tableView: UITableView!
  
  
  override func setUp() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
    mainViewController = viewController as? MainViewController
    mainViewController.loadViewIfNeeded()
    
    mockPresentor = MockMainPresentor()
    mainViewController.presentor = mockPresentor
    
    tableView = mainViewController.tableView
  }

  override func tearDown() {}
  
  func test_TebleViewIsNotNill() {
    XCTAssertNotNil(tableView)
  }
  
  func test_SetsTableViewDataSource() {
    XCTAssertTrue(tableView.dataSource is MainViewController)
  }
  
  func test_SetsTableViewDelegate() {
    XCTAssertTrue(tableView.delegate is MainViewController)
  }
  
  func test_MainViewController_HasAddBarButton() {
    let target = mainViewController.navigationItem.rightBarButtonItem?.target
    XCTAssertEqual(target as? UIViewController, mainViewController)
  }
  
  func test_MainViewController_HasReloadBarButton() {
    let target = mainViewController.navigationItem.leftBarButtonItem?.target
    XCTAssertEqual(target as? UIViewController, mainViewController)
  }
  
  
  func test_NumberSectionsInTableView() {
    XCTAssertEqual(tableView.numberOfSections, 1)
  }
  
  func test_NumbersRowInSection() {
    XCTAssertEqual(tableView.numberOfRows(inSection: 0), 0)
    
    let city = City(name: "Sochi", temperature: 20.0, humidity: 70, icon: "x")
    mockPresentor.cities.append(city)
    tableView.reloadData()
    
    XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
  }
  
  func test_CellForRow_ReturnsItemCell() {
    XCTAssertNotNil(loadCellWithCity())
  }

  
  func test_CheckCityInCell() {
    guard let cell = loadCellWithCity() else { XCTFail(); return }
    
    XCTAssertEqual(cell.textLabel?.text, "Sochi")
    XCTAssertEqual(cell.detailTextLabel?.text, "temp: \(20.0)° C")
  }
  
  
  //Asserts
  private func loadCellWithCity() -> UITableViewCell? {
    
    let city = City(name: "Sochi", temperature: 20.0, humidity: 70, icon: "x")
    mockPresentor.cities.append(city)
    tableView.reloadData()
    let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
    
    return cell
  }


}


extension MainViewControllerTests {
  
  class MockMainPresentor: MainPresentorType {
    var cities: [City] = []
    
    func updateData() {}
    
    func getCountCities() -> Int {
      return cities.count
    }
    
    func getCityAtIndex(_ idnex: Int) -> City {
      return cities[idnex]
    }
    
    func deleteElementAtIndex(_ index: Int) -> City {
      return cities.remove(at: index)
    }

  }
  
}
