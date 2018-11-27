//
//  AddCityPresentor.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 26/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import Foundation
import Unbox

protocol AddCityPresentorDelegate: class {}


protocol AddCityPresentorType {
  func addCityWithName (_ cityName: String)
}

class AddCityPresentor: AddCityPresentorType {
  
  weak var delegate: AddCityPresentorDelegate?
  let view: AddCityView
  let dataManager: DataManagerType
  let apiManager: API_ManagerType
  let callback: EmptyClosure?
  
  init(dataManager: DataManagerType, apiManager: API_ManagerType, view: AddCityView, delegate: AddCityPresentorDelegate?, callback: EmptyClosure? = nil) {
    self.dataManager = dataManager
    self.apiManager = apiManager
    self.view = view
    self.delegate = delegate
    self.callback = callback
  }
  
  func addCityWithName (_ cityName: String) {
    apiManager.addCityWithName(cityName) { [weak self] result, error in
      if let result = result as? [String : Any], let city = try? City(unboxer: Unboxer(dictionary: result)) {
        self?.dataManager.addCity(city)
      } else {
        print(error ?? "nil")
      }
    }
  }
  func runCallback() {
    guard let callBack = callback else { return }
    callBack()
  }
}
