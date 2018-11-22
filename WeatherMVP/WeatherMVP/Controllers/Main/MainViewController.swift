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
  
  //MARK: -
  //MARK: ControllerLifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  
  //MARK: -
  //MARK: ActionsAndChanges
  
  @IBAction func updateData(_ sender: UIBarButtonItem) {
  }
  
  @IBAction func addCity(_ sender: UIBarButtonItem) {
  }
  
  
  
  
  

}

extension MainView {
  
  
  
}
