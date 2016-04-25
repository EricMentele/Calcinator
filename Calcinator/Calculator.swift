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
    // Operation types
    // Operations
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
    
    //Set negative/positive
    //Convert to percentage
    //Perform Operation
    // MARK: Public Methods
    
}