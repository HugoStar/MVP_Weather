//
//  AddViewController.swift
//  WeatherMVP
//
//  Created by Мишустин Сергеевич on 26/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import UIKit

protocol AddCityView {
  
}

class AddCityViewController: UIViewController {

  //MARK: -
  //MARK: Outlets
  @IBOutlet weak var inputFieldName: UITextField!
  

  //MARK: -
  //MARK: Properties
  var presentor: AddCityPresentorType!
  
  //MARK: -
  //MARK: ControllerLifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  //MARK: -
  //MARK: ActionsAndChanges
  @IBAction func addNameTap(_ sender: Any) {
  }
  
  @IBAction func cancelTap(_ sender: Any) {
  }
  
  
}

extension AddCityViewController: AddCityView {
  
}

extension AddCityViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
