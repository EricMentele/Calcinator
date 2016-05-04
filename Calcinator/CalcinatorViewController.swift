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
    @IBOutlet weak var currentOperandLabel: UILabel!
    
    // MARK: Properties
    private let calculator = Calculator()
    
    private var userIsInTheMiddleOfTyping = false
    private var pointAdded = false
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentOperandLabel.text = String(calculator.result)
    }
    
    // MARK: Actions
    @IBAction func digitPressed(sender: UIButton) {
        guard sender.currentTitle == "." && pointAdded == false else {
            return
        }
        
        if !userIsInTheMiddleOfTyping {
            self.currentOperandLabel.text = sender.currentTitle!
        } else {
            self.currentOperandLabel.text = currentOperandLabel.text! + sender.currentTitle!
        }
        
        if sender.currentTitle  == "." {
            self.pointAdded = true
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func operatorPressed(sender: UIButton) {
        self.pointAdded = false
        
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
