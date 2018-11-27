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
  
  func showAddScreen(with callBack: EmptyClosure?, andDelegate delegate: AddCityPresentorDelegate? = nil) {
    let scene = FeatureSceneFactory.makeAddCityController(delegate: delegate, callback: callBack)
    navigationController.pushViewController(scene, animated: true)
  }
  
  func backToViewController() {
    navigationController.popViewController(animated: true)
  }
  
}

extension FeatureCoordinator: MainPresentorDelegate {

  func didAddCity(with callBack: EmptyClosure?) {
    showAddScreen(with: callBack, andDelegate: self)
  }
  
  func didEnterCity(_ city: City, andCallback: @escaping EmptyClosure) {
    //FIXME: Show DetailController
  }
}

extension FeatureCoordinator: AddCityPresentorDelegate {
  func backToPreviousViewController() {
    navigationController.popViewController(animated: true)
  }
}
