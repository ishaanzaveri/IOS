//
//  model.swift
//  Calc
//
//  Created by Ishaan  on 19/06/17.
//  Copyright © 2017 Ishaan . All rights reserved.
//

import Foundation
func factorial (num:Double) -> Double{
    var x: Int = 1
    var y: Int = 1
    if num > 0 {
        repeat{
            y+=1
            x=x*y
        } while Int(num) != y
    }
    return Double (x)
}
struct brainCalc {
    private var accumulator: Double?
    private enum operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double )
        case equals
    }
    private var operations : Dictionary<String, operation> = [
        "π" : operation.constant(Double.pi),
        "e" : operation.constant(M_E),
        "log": operation.unaryOperation(log10),
        "ln" : operation.unaryOperation(log),
        "Sin": operation.unaryOperation(sin),
        "Cos": operation.unaryOperation(cos),
        "Tan": operation.unaryOperation(tan),
        "√" : operation.unaryOperation(sqrt),
        "±" : operation.unaryOperation({-$0}),
        "%" : operation.unaryOperation({$0/100}),
        "+":operation.binaryOperation({$0 + $1}),
        "−":operation.binaryOperation({$0 - $1}),
        "×":operation.binaryOperation({$0 * $1}),
        "÷":operation.binaryOperation({$0 / $1}),
        "!":operation.unaryOperation(factorial),
        "=":operation.equals
        
        
        
    ]
    mutating func PerformOperation(_ symbol: String){
        if let operation = operations[symbol]{
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let funtion):
                pendingBinaryOpp = PendingBinaryOpp(function: funtion, firstOperation: accumulator!)
                accumulator = nil
            case .equals:
                PerformPendingBinaryOpp()
            }
        }
    }
    private mutating func PerformPendingBinaryOpp(){
        if pendingBinaryOpp != nil && accumulator != nil{
            accumulator = pendingBinaryOpp!.perform(with: accumulator!)
            pendingBinaryOpp = nil
        }
    }
    private var pendingBinaryOpp: PendingBinaryOpp?
    private struct PendingBinaryOpp {
        let function : (Double,Double) -> Double
        let firstOperation : Double
        func perform (with secondOpp: Double) -> Double{
            return function(firstOperation,secondOpp)
        }
        
    }
    mutating func setOperand(_ operand:Double){
        accumulator = operand
    }
    var result:Double?{
        get {
            return accumulator
        }
        
    }
}
