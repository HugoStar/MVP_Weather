//
//  FeatureFactory.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 23/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import UIKit


struct FeatureSceneFactory {
  
  static func makeMainController(delegate: MainPresentorDelegate?) -> MainViewController {
    let viewController = UIStoryboard(name: "Main", bundle: nil)
      .instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    let dataManager = DataManager()
    let presentor = MainPresentor(dataManager: dataManager, view: viewController, delegate: delegate)
    viewController.presentor = presentor
    return viewController
  }
  
  static func makeAddCityController(delegate: AddCityPresentorDelegate? = nil, callback: EmptyClosure? = nil) -> AddCityViewController {
    let viewController = UIStoryboard(name: "Main", bundle: nil)
      .instantiateViewController(withIdentifier: "AddCityViewController") as! AddCityViewController
    let dataManager = DataManager()
    let apiManager = API_Manager(with: NetClient())
    let presentor = AddCityPresentor(dataManager: dataManager, apiManager: apiManager, view: viewController, delegate: delegate, callback: callback)
    viewController.presentor = presentor
    return viewController
  }
  
  static func makeDetailViewController(withCity city: City) -> DetailViewController {
    let viewController = UIStoryboard(name: "Main", bundle: nil)
      .instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    let presentor = DetailViewPresentor(city: city, view: viewController)
    viewController.presentor = presentor
    return viewController
  }
}
