//
//  MainViewController.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 22/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import UIKit

protocol MainView {
  
  func reloadTableView()
  
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
    self.navigationItem.hidesBackButton = true
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presentor.updateData()
  }

  //MARK: -
  //MARK: ActionsAndChanges
  @IBAction func addCity(_ sender: UIBarButtonItem) {
    presentor.showControllerForAddCity()
  }

  @IBAction func reloadData(_ sender: UIBarButtonItem) {
    presentor.updateData()
    tableView.reloadData()
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
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presentor.showDetailViewController(cityIndex: indexPath.row)
  }  
}

extension MainViewController: MainView {
  func reloadTableView() {
    tableView.reloadData()
  }
}
