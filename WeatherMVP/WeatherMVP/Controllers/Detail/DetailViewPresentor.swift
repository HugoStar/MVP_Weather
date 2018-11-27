//
//  DetailViewPresentor.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 27/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import Foundation

protocol DetailViewPresentorType {
  func load()
}

class DetailViewPresentor: DetailViewPresentorType {
  
  let city: City
  let view: DetailView
  
  init(city: City, view: DetailView) {
    self.city = city
    self.view = view
  }
  
  func load() {
    view.loadCityNameLabelText(city.name)
    view.loadTempLabelText("\(city.temperature)° С")
    view.loadIconLabelText(iconNameToChar(icon: city.icon))
    view.loadHumidityLabelText("\(city.humidity) %")
  }
  
}
