//
//  Calculator.swift
//  Calcinator
//
//  Created by Eric Mentele on 4/25/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

import Foundation

class Calculator {
    // MARK: Public Properties
        /// Get the resulting total of operations
    var result: Double {
        return total
    }
    
    // MARK: Private Properties
    private enum Operation {
        case BinaryOperation((Double, Double) -> Double)
        case UnaryOperation((Double) -> Double)
        case Equals
    }
    
    private let operations: Dictionary<String,Operation> = [
        "C" : Operation.UnaryOperation({ $0 * 0 }),
        "÷" : Operation.BinaryOperation({ $0 / $1 }),
        "×" : Operation.BinaryOperation({ $0 * $1 }),
        "−" : Operation.BinaryOperation({ $0 - $1 }),
        "+" : Operation.BinaryOperation({ $0 + $1 }),
        "=" : Operation.Equals
    ]
    
    private var pending: PendingBinaryOperation?
    
    struct PendingBinaryOperation {
        let operation: (Double, Double) -> Double
        let firstOperand: Double
    }
    
        /// Keep track of the running total of operations
    private var total = 0.0
    
    // MARK: Public Methods
    /**
     Set starting value for opperations.
     
     - parameter opperand: The number to be operated on.
     */
    func setOperand(opperand: Double) {
        total = opperand
    }
    
    /**
     Resets total/opperand to 0
     */
    func clear() {
        total = 0.0
    }
    
    /**
     Changes sign of opperand to negative/or posative.
     */
    func toggleSign() {
        total = total * -1
    }
    
    /**
     Converts the current total to a percentage.
     */
    func getPercent() {
        total = total / 100
    }
    
    func doOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .BinaryOperation(let function):
                doPendingOperation()
                pending = PendingBinaryOperation(operation: function, firstOperand: total)
            case .Equals:
                doPendingOperation()
            }
        }
    }
    // MARK: Private Methods
    private func doPendingOperation() {
        if let pendingOperation = pending {
            total = pendingOperation.operation(pendingOperation.firstOperand, total)
            pending = nil
        }
    }
}