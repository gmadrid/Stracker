//
//  OptionsHouseParserTest.swift
//  Stracker
//
//  Created by George Madrid on 6/18/17.
//  Copyright © 2017 George Madrid. All rights reserved.
//

import CSV
import XCTest
@testable import Stracker

class OptionsHouseParserTest: XCTestCase {
  
  let parser = OptionsHouseParser()
  let header = "\"Date / Time\",\"Type\",\"Account #\",\"Account Name\",\"Description\",\"Fee\",\"Comm\",\"Amount\""
  
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func setupLine(line: String) -> CSVReader {
    let str = header + "\n" + line
    let stream = InputStream.init(data: str.data(using: .utf8)!)
    let csv = try! CSVReader(stream: stream, hasHeaderRow: true)
    return csv
  }
  
  func parseLine(line: String) throws -> Transaction {
    let csv = setupLine(line: line)
    csv.next()
    return try parser.parse(csv: csv)
  }
  
  func testWithdrawal() {
    let str = "\"02/04/2015 05:13:42 PM\",\"ACH Deposit\",\"4ZE22558\",\"Joint With Right Of Survivorship - x558\",\"ACH DEPOSIT $6,027.42 ON 02/04/2015\",\"$0.00\",\"$0.00\",\"$6,027.42\""
    let t = try! parseLine(line: str)
    
    XCTAssertNotNil(t as? Cash)
    
  }
  
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
