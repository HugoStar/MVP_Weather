//
//  String+Icon.swift
//  WeatherViper
//
//  Created by Мишустин Сергеевич on 31/10/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import UIKit

/**
 * Maps an icon information from the API to a local char
 * Source: http://openweathermap.org/weather-conditions
 */
public func iconNameToChar(icon: String) -> String {
  switch icon {
  case "01d":
    return "\u{f11b}"
  case "01n":
    return "\u{f110}"
  case "02d":
    return "\u{f112}"
  case "02n":
    return "\u{f104}"
  case "03d", "03n":
    return "\u{f111}"
  case "04d", "04n":
    return "\u{f111}"
  case "09d", "09n":
    return "\u{f116}"
  case "10d", "10n":
    return "\u{f113}"
  case "11d", "11n":
    return "\u{f10d}"
  case "13d", "13n":
    return "\u{f119}"
  case "50d", "50n":
    return "\u{f10e}"
  default:
    return "E"
  }
}

func imageFromText(text: NSString, font: UIFont) -> UIImage {
  
  let size = text.size(withAttributes: [NSAttributedString.Key.font: font])
  
  UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
  text.draw(at: CGPoint(x: 0, y:0), withAttributes: [NSAttributedString.Key.font: font])
  
  let image = UIGraphicsGetImageFromCurrentImageContext()
  UIGraphicsEndImageContext()
  
  return image ?? UIImage()
}
