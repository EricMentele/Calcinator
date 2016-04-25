//
//  CalcinatorTests.swift
//  CalcinatorTests
//
//  Created by Eric Mentele on 4/25/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

import XCTest
@testable import Calcinator

class CalcinatorTests: XCTestCase {
    func testOpperandAssignment() {
        let calc = Calculator()
        calc.setOperand(5.0)
        
        XCTAssertEqual(calc.result, 5.0)
    }
    
    func testClearOpperand() {
        let calc = Calculator()
        calc.setOperand(5)
        calc.clear()
        
        XCTAssertEqual(calc.result, 0)
    }
}
