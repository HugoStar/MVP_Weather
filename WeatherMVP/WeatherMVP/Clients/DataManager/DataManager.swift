//
//  DataManager.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import Foundation
import Realm


protocol DataManagerType {
  
  func addCity(_ city: City)
  func loadCities() -> [City]
  func deleteCity(_ city: City)
  
}


class DataManager: DataManagerType {
  
  private let realm = RealmProvider.realm()
  
  func addCity(_ city: City) {
    try! realm.write {
      realm.add(city, update: true)
    }
  }
  
  func loadCities() -> [City] {
    return Array(realm.objects(City.self))
  }
  
  func deleteCity(_ city: City) {
    try! realm.write {
      realm.delete(city)
    }
  }

}
