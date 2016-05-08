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
    // MARK: Calculator Model
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
        
        XCTAssertEqual(calc.result, 6)
    }
    
    func testToggleSign() {
        let calc = Calculator()
        calc.setOperand(5)
        calc.doOperation("\u{207A}\u{2215}\u{208B}")
        
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
    
    func testDoOperationMultiMultiply() {
        let calc = Calculator()
        calc.setOperand(5)
        calc.doOperation("×")
        calc.doOperation("×")
        
        XCTAssertEqual(calc.result, 5)
    }
    
    func testDoOperationSubtract() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("−")
        calc.setOperand(2)
        calc.doOperation("−")
        
        XCTAssertEqual(calc.result, 2)
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
    
    func testDoOperationSwitch() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("×")
        calc.doOperation("-")
        
        XCTAssertEqual(calc.result, 8)
    }
    
    func testOperationWithTotal() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("×")
        calc.setOperand(2)
        calc.doOperation("=")
        calc.doOperation("×")
        calc.setOperand(2)
        calc.doOperation("=")
        
        XCTAssertEqual(calc.result, 32)
    }
    
    func testFifteenAndTwentyPercentOperations() {
        let calc = Calculator()
        calc.setOperand(100)
        calc.doOperation("15%")
        calc.doOperation("20%")
        
        XCTAssertEqual(calc.result, 3)
    }
    
    func testClearNumber() {
        let calc = Calculator()
        calc.setOperand(8)
        calc.doOperation("C")
        
        XCTAssertEqual(calc.result, 0.0)
    }
    
    func testNegativeNumber() {
        let calc = Calculator()
        calc.setOperand(3)
        calc.doOperation("\u{207A}\u{2215}\u{208B}")
        calc.doOperation("+")
        calc.setOperand(5)
        calc.doOperation("=")
        
        XCTAssertEqual(calc.result, 2)
    }
    
    // MARK: Calculator View Controller
    func testPointAddedNotDuplicated() {
        let controller = CalcinatorViewController()
        let button = UIButton()
        let label = UILabel()
        
        label.text = ""
        controller.displayLabel = label
        
        button.setTitle(".", forState: .Normal)
        controller.digitPressed(button)
        controller.digitPressed(button)
        
        XCTAssertEqual(controller.displayLabel.text!, ".")
    }
    
    func testOperationAndPointAfterOperation() {
        let controller = CalcinatorViewController()
        let button = UIButton()
        let label = UILabel()
        
        label.text = ""
        controller.displayLabel = label
        
        button.setTitle(".", forState: .Normal)
        controller.digitPressed(button)
        button.setTitle("5", forState: .Normal)
        controller.digitPressed(button)
        button.setTitle("+", forState: .Normal)
        controller.operatorPressed(button)
        button.setTitle(".", forState: .Normal)
        controller.digitPressed(button)
        button.setTitle("5", forState: .Normal)
        controller.digitPressed(button)
        button.setTitle("=", forState: .Normal)
        controller.operatorPressed(button)
        
        XCTAssertEqual(controller.displayLabel.text!, "1.0")
    }
    
    func testClearDecimal() {
    
    }
}
