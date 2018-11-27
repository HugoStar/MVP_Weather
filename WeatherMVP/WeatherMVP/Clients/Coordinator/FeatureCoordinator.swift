//
//  FeatureCoordinator.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 23/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import UIKit


class FeatureCoordinator: Coordinator {
  
  private let navigationController: UINavigationController
  
  init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
  }
  
  func start() {
    showMainScreen()
  }
}

extension FeatureCoordinator {
  
  func showMainScreen() {
    let scene = FeatureSceneFactory.makeMainController(delegate: self)
    navigationController.viewControllers = [scene]
  }
  
  func showAddScreen(with callBack: EmptyClosure?) {
    let scene = FeatureSceneFactory.makeAddCityController()
    navigationController.pushViewController(scene, animated: true)
  }
  
}

extension FeatureCoordinator: MainPresentorDelegate {
  func didAddCity(with callBack: EmptyClosure) {
    //FIXME: Show AddViewController
  }
  
  func didEnterCity(_ city: City, andCallback: @escaping EmptyClosure) {
    //FIXME: Show DetailController
  }
}
