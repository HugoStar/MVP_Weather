//
//  RealmProvider.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import Foundation
import RealmSwift

class RealmProvider {
  class func realm() -> Realm {
    if let _ = NSClassFromString("XCTest") {
      return try! Realm(configuration: Realm.Configuration(fileURL: nil, inMemoryIdentifier: "test", encryptionKey: nil, readOnly: false, schemaVersion: 0, migrationBlock: nil, objectTypes: nil))
    } else {
      return try! Realm();
      
    }
  }
}
