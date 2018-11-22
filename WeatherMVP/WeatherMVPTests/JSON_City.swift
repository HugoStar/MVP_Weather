//
//  JSON_City.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import Foundation

struct JSON_City {
  
  static let jsonCity = [
    "coord":[
      "lon":-0.13,
      "lat":51.51
    ],
    "weather":[[
      "id":300,
      "main":"Drizzle",
      "description":"light intensity drizzle",
      "icon":"09d"
      ]],
    "base":"stations",
    "main":[
      "temp":280.32,
      "pressure":1012,
      "humidity":81,
      "temp_min":279.15,
      "temp_max":281.15
    ],
    "visibility":10000,
    "wind":[
      "speed":4.1,
      "deg":80
    ],
    "clouds":[
      "all":90
    ],
    "dt":1485789600,
    "sys":[
      "type":1,
      "id":5091,
      "message":0.0103,
      "country":"GB",
      "sunrise":1485762037,
      "sunset":1485794875
    ],
    "id":2643743,
    "name":"London",
    "cod":200
    ] as [String : Any]
}
