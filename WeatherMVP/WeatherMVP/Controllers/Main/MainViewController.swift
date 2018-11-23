//
//  MainViewController.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import UIKit

protocol MainView {
  
  
  
}

class MainViewController: UIViewController {
  
  //MARK: -
  //MARK: Outlets
  @IBOutlet weak var tableView: UITableView!

  //MARK: -
  //MARK: Properties
  var presentor: MainPresentorType!
  
  //MARK: -
  //MARK: ControllerLifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    
  }

  //MARK: -
  //MARK: ActionsAndChanges
  
  @IBAction func updateData(_ sender: UIBarButtonItem) {
  }
  
  @IBAction func addCity(_ sender: UIBarButtonItem) {
  }

}


extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presentor.getCountCities()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let city = presentor.getCityAtIndex(indexPath.row)
    let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
    cell.textLabel?.text = city.name
    cell.detailTextLabel?.text = "temp: \(city.temperature)° C"
    
    return cell
  }
  
}

extension MainViewController: UITableViewDelegate {
  
}

extension MainView {}
