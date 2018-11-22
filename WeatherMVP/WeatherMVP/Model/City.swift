//
//  City.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import Unbox

class City: Object, Unboxable {

  @objc dynamic var name: String = ""
  @objc dynamic var temperature: Double = 0.0
  @objc dynamic var humidity: Int = 0
  @objc dynamic var icon: String = ""
  
  override static func primaryKey() -> String? {
    return "name"
  }
  
  convenience init(name: String, temperature: Double, humidity: Int, icon: String) {
    self.init()
    self.name = name
    self.temperature = temperature
    self.humidity = humidity
    self.icon = icon
  }
  
  convenience required init(unboxer: Unboxer) throws {
    self.init()
    self.name = try unboxer.unbox(key: "name")
    self.temperature = try unboxer.unbox(keyPath: "main.temp")
    self.humidity = try unboxer.unbox(keyPath: "main.humidity")
    self.icon = try unboxer.unbox(keyPath: "weather.0.icon")
  }

}
