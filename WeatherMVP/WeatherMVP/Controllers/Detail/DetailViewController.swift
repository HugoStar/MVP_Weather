//
//  DetailViewController.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 27/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import UIKit

protocol DetailView {
  
  func loadTempLabelText(_ temp: String)
  func loadHumidityLabelText(_ humidy: String)
  func loadIconLabelText(_ icon: String)
  func loadCityNameLabelText(_ cityName: String)
  
}

class DetailViewController: UIViewController {

  // MARK: -
  // MARK: Outlets
  @IBOutlet weak var tempLabel: UILabel!
  @IBOutlet weak var humidityLabel: UILabel!
  @IBOutlet weak var iconLabel: UILabel!
  @IBOutlet weak var cityNameLabel: UILabel!
  
  //MARK: -
  //MARK: Properties
  var presentor: DetailViewPresentorType!
  
  //MARK: -
  //MARK: ControllerLifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    presentor.load()
  }
  
  //MARK: -
  //MARK: ActionsAndChanges

}

extension DetailViewController: DetailView {
  func loadTempLabelText(_ temp: String) {
    tempLabel.text = temp
  }
  func loadHumidityLabelText(_ humidy: String) {
    humidityLabel.text = humidy
  }
  func loadIconLabelText(_ icon: String) {
    iconLabel.text = icon
  }
  func loadCityNameLabelText(_ cityName: String) {
    cityNameLabel.text = cityName
  }
}
