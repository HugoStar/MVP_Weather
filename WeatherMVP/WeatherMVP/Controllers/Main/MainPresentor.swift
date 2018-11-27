//
//  MainPresentor.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import Foundation

protocol MainPresentorDelegate: class {
  func didEnterCity(_ city: City)
  func didAddCity(with callBack: EmptyClosure?)
}

protocol MainPresentorType {
  
  func updateData()
  func getCountCities() -> Int
  func getCityAtIndex(_ idnex: Int) -> City
  func deleteElementAtIndex(_ index: Int) -> City
  
  func showControllerForAddCity()
  func showDetailViewController(cityIndex index: Int)
}

class MainPresentor: MainPresentorType {

  weak var delegate: MainPresentorDelegate?
  let view: MainView
  let dataManager: DataManagerType
  var cities: [City] = []
  
  init(dataManager: DataManagerType, view: MainView, delegate: MainPresentorDelegate?) {
    self.dataManager = dataManager
    self.view = view
    self.delegate = delegate
  }
  
  func updateData() {
    print(dataManager.loadCities())
    cities = dataManager.loadCities()
  }
  
  func getCountCities() -> Int {
    return cities.count
  }
  
  func getCityAtIndex(_ idnex: Int) -> City {
    return cities[idnex]
  }
  
  @discardableResult
  func deleteElementAtIndex(_ index: Int) -> City {
    let city = cities.remove(at: index)
    dataManager.deleteCity(city)
    return city
  }
  
  func showControllerForAddCity() {
    delegate?.didAddCity { [weak self] in
      self?.updateData()
      self?.view.reloadTableView()
    }
  }
  
  func showDetailViewController(cityIndex index: Int) {
    delegate?.didEnterCity(cities[index])
  }
}
