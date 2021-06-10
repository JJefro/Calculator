//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Jevgenijs Jefrosinins on 10/06/2021.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    // Optional Touple
    private var intermedeateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermedeateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermedeateCalculation?.n1 {
            let operation = intermedeateCalculation?.calcMethod
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
    
}
