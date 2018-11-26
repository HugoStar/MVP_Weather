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
  @IBOutlet weak var buttonAddCity: UIButton!
  @IBOutlet weak var buttonCancel: UIButton!
  
  

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
    presentor.addCityWithName(inputFieldName.text!)
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
