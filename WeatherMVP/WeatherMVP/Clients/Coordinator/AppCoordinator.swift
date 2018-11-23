//
//  AppCoordinator.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 23/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
  
  private let window: UIWindow
  private let navigationController: UINavigationController
  var starterCoordinator: Coordinator?
  
  init(window: UIWindow = UIWindow(),
       navigationController: UINavigationController = UINavigationController()) {
    self.window = window
    self.navigationController = navigationController
    
    setupWindow()
    setupStarterCoordinator()
  }
  
  private func setupWindow() {
    self.window.rootViewController = navigationController
    self.window.makeKeyAndVisible()
  }
  
  private func setupStarterCoordinator() {
    starterCoordinator = FeatureCoordinator(navigationController: navigationController)
  }
  
  func start() {
    starterCoordinator?.start()
  }

}
