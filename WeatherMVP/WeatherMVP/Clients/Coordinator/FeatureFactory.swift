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
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
    let dataManager = DataManager()
    let presentor = MainPresentor(dataManager: dataManager, view: viewController, delegate: delegate)
    viewController.presentor = presentor
    return viewController
  }
  
  
}