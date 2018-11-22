//
//  API_Manager.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import Foundation
import Alamofire

typealias NETResponce = (_ dataResponse: Any?, _ error: Error?) -> ()

enum NETError: Error {
  case uncorrectURL
  case runtimeError(String)
}


class API_Manager {
  
  private let api_key = "0f49f454b8ae2376d58805cc4e9d5a10"
  private let mainURL = "http://api.openweathermap.org/data/2.5/weather"
  
  let netClient: NetClientType
  
  required init(with netClient: NetClientType) {
    self.netClient = netClient
  }
  
  
  func addCityWithName(_ name: String, callBack: @escaping NETResponce) {
    let currentURL = "\(mainURL)?q=\(name)&units=metric&APPID=\(api_key)"
    
    netClient.getDataWithURL(currentURL) { data, error in
      guard let data = data else { callBack(nil, error); return  }
      callBack(data, nil)
    }
  }
  
}


protocol NetClientType {
  func getDataWithURL(_ url: String, response: @escaping NETResponce)
}

class NetClient: NetClientType {
  
  func getDataWithURL(_ url: String, response: @escaping NETResponce) {
    guard let url = URL(string: url) else {
      response(nil, NETError.uncorrectURL)
      return
    }
    Alamofire.request(url).responseJSON { dataResponse in
      
      switch dataResponse.response!.statusCode {
      case 200 ... 299:
        response(dataResponse.value!, nil)
      default:
        let errorDicteonary = dataResponse.value as! [String : Any]
        let errorString = errorDicteonary["message"] as! String
        response(nil, NETError.runtimeError(errorString))
      }
    }
  }
  
}
