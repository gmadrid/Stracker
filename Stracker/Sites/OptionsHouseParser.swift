//
//  OptionsHouseParser.swift
//  Stracker
//
//  Created by George Madrid on 6/18/17.
//  Copyright © 2017 George Madrid. All rights reserved.
//

import CSV
import Foundation

class OptionsHouseParser {
  init() {
    
  }
  
  func parse(csv: CSVReader) throws -> Transaction {
    return Cash()
  }
}
