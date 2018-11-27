//
//  ExtentionsTests.swift
//  WeatherMVPTests
//
//  Created by Мишустин Сергеевич on 27/11/2018.
//  Copyright © 2018 LTD Zebka. All rights reserved.
//

import XCTest
@testable import WeatherMVP

class ExtentionsTests: XCTestCase {

    override func setUp() {}

    override func tearDown() {}
  
  func test_TestingConvertstirngToIcon1() {
    let tempStirng = "01d"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f11b}")
  }
  
  func test_TestingConvertstirngToIcon2() {
    let tempStirng = "01n"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f110}")
  }
  
  func test_TestingConvertstirngToIcon3() {
    let tempStirng = "02d"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f112}")
  }
  
  func test_TestingConvertstirngToIcon4() {
    let tempStirng = "03d"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f111}")
  }
  
  func test_TestingConvertstirngToIcon5() {
    let tempStirng = "04d"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f111}")
  }
  
  func test_TestingConvertstirngToIcon6() {
    let tempStirng = "09d"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f116}")
  }
  
  func test_TestingConvertstirngToIcon7() {
    let tempStirng = "10d"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f113}")
  }
  
  func test_TestingConvertstirngToIcon8() {
    let tempStirng = "02n"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f104}")
  }
  
  func test_TestingConvertstirngToIcon9() {
    let tempStirng = "11d"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f10d}")
  }
  
  func test_TestingConvertstirngToIcon10() {
    let tempStirng = "13d"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f119}")
  }
  
  func test_TestingConvertstirngToIcon11() {
    let tempStirng = "50d"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "\u{f10e}")
  }
  
  func test_TestingConvertstirngToIconDefault() {
    let tempStirng = "xxx"
    XCTAssertEqual(iconNameToChar(icon: tempStirng), "E")
  }
  
  func test_ConvertStringToImage() {
    
    let tempImage = imageFromText(text: "Test", font: UIFont.systemFont(ofSize: 12))
    XCTAssertNotNil(tempImage)
    
  }
  


}
