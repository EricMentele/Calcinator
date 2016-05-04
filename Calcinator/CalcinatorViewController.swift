//
//  CalcinatorViewController.swift
//  Calcinator
//
//  Created by Eric Mentele on 4/25/16.
//  Copyright © 2016 Eric Mentele. All rights reserved.
//

import UIKit

class CalcinatorViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var displayLabel: UILabel!
    
    // MARK: Properties
    private let calculator = Calculator()
    
    private var userIsInTheMiddleOfTyping = false
    private var pointAdded = false
    
    private var displayValue: Double {
        get {
            let value: Double = Double(displayLabel.text!)!
            return value
        }
        set {
            self.displayLabel.text = String(newValue)
        }
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    @IBAction func digitPressed(sender: UIButton) {
        guard let digit = sender.currentTitle else {
            return
        }
        
        if digit == "." && pointAdded == true {
            return
        }
        
        if userIsInTheMiddleOfTyping {
            self.displayLabel.text = displayLabel.text! + digit
        } else {
            self.displayLabel.text = digit
        }
        
        if sender.currentTitle  == "." {
            self.pointAdded = true
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func operatorPressed(sender: UIButton) {
        guard let pressedOperator = sender.currentTitle else {
            return
        }
        
        pointAdded = false
        
        if userIsInTheMiddleOfTyping {
            calculator.setOperand(displayValue)
            self.userIsInTheMiddleOfTyping = false
        }
        
        calculator.doOperation(pressedOperator)
        self.displayValue = calculator.result
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
