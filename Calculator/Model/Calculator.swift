//
//  Calculator.swift
//  Calculator
//
//  Created by Nagarjuna Ramagiri on 4/22/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    private var number:Double?
    private var intermediateCalculation: (n1: Double, operation: String)?
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(operation:String) -> Double? {
        guard let num = number else {
            return nil
        }
        if let n1 = intermediateCalculation?.n1, let op = intermediateCalculation?.operation {
            intermediateCalculation = nil
            switch op {
            case "÷":
                return n1/num
            case "×":
                return n1*num
            case "-":
                return n1-num
            case "+":
                return n1+num
            case "=":
                return calculate(operation: op)
            default:
                return nil
            }
        } else {
            intermediateCalculation = (n1:num, operation:operation)
        }
        return nil
    }
}
