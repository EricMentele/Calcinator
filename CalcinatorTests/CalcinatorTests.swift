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
    // test unary operations
    func testOpperandAssignment() {
        let calc = Calculator()
        calc.setOperand(5.0)
        
        XCTAssertEqual(calc.result, 5.0)
    }
    
    func testClearOpperand() {
        let calc = Calculator()
        calc.setOperand(5)
        calc.doOperation("C")
        
        XCTAssertEqual(calc.result, 0)
    }
    
    func testClearWithCalculation() {
        let calc = Calculator()
        calc.setOperand(5)
        calc.doOperation("+")
        calc.setOperand(5)
        calc.doOperation("C")
        calc.setOperand(6)
        calc.doOperation("=")
        
        XCTAssertEqual(calc.result, 11)
    }
    
    func testToggleSign() {
        let calc = Calculator()
        calc.setOperand(5)
        calc.doOperation("±")
        
        XCTAssertEqual(calc.result, -5)
    }
    
    func testGetPercent() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("%")
        
        XCTAssertEqual(calc.result, 0.08)
    }
    // test operations
    func testDoOperationDivision() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("÷")
        calc.setOperand(2)
        calc.doOperation("÷")
        
        XCTAssertEqual(calc.result, 4)
    }
    
    func testDoOperationMultiply() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("×")
        calc.setOperand(2)
        calc.doOperation("×")
        
        XCTAssertEqual(calc.result, 16)
    }
    
    func testDoOperationSubtract() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("−")
        calc.setOperand(2)
        calc.doOperation("−")
        
        XCTAssertEqual(calc.result, 6)
    }
    
    func testDoOperationAdd() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("+")
        calc.setOperand(2)
        calc.doOperation("+")
        
        XCTAssertEqual(calc.result, 10)
    }
    
    func testDoOperationEquals() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("=")
        
        XCTAssertEqual(calc.result, 8)
    }
    
    func testDoOperationOpEquals() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("×")
        calc.setOperand(8)
        calc.doOperation("=")
        
        XCTAssertEqual(calc.result, 64)
    }
}
