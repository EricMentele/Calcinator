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
    
    /// Keep track of the running total of operations
    private var total: Double = 0
    
    // MARK: Private Properties
    private var pending: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let operation: (Double, Double) -> Double
        let firstOperand: Double
    }
    
    private let operations: Dictionary<String,Operation> = [
        "C" : Operation.UnaryOperation({ $0 * 0 }),
        "\u{207A}\u{2215}\u{208B}" : Operation.UnaryOperation({ -$0 }),
        "%" : Operation.UnaryOperation({ $0 / 100 }),
        "÷" : Operation.BinaryOperation({ $0 / $1 }),
        "×" : Operation.BinaryOperation({ $0 * $1 }),
        "−" : Operation.BinaryOperation({ $0 - $1 }),
        "+" : Operation.BinaryOperation({ $0 + $1 }),
        "=" : Operation.Equals
    ]
    
    private enum Operation {
        case BinaryOperation((Double, Double) -> Double)
        case UnaryOperation((Double) -> Double)
        case Equals
    }
    
    // MARK: Public Methods
    /**
     Set starting value for opperations.
     
     - parameter opperand: The number to be operated on.
     */
    func setOperand(opperand: Double) {
        total = opperand
    }
    
    func doOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .UnaryOperation(let function):
                total = function(total)
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