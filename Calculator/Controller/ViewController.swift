//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber = true
    private var calculator = Calculator()
    
    var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to double")
            }
            return number
        }
        set {
            let floorValue = floor(newValue)
            if floorValue == newValue{
                displayLabel.text = "\(Int(floorValue))"
            } else {
                displayLabel.text = "\(newValue)"
            }

        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let result = calculator.calculate(operation: sender.currentTitle!) {
            displayValue = result
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numString = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numString
                isFinishedTypingNumber = false
            } else {
                displayLabel.text  = displayLabel.text! + numString
            }
        }
    }

    @IBAction func decimalPressed(_ sender: UIButton) {
        if let numString = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = "0" + numString
                isFinishedTypingNumber = false
            } else {
                if (!displayLabel.text!.contains(".")) {
                    displayLabel.text  = displayLabel.text! + numString
                }
            }
        }
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        displayValue = 0
        isFinishedTypingNumber = true
    }
    
    @IBAction func negatePressed(_ sender: UIButton) {
        displayValue *= -1
    }
    
    @IBAction func percentilePressed(_ sender: Any) {
        displayValue *= 0.01
    }
}

