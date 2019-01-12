//
//  CalculationModel.swift
//  Utility_Calculator
//
//  Created by LIN LIU on 20/12/18.
//  Copyright © 2018 LinLiu. All rights reserved.
//

import Foundation

struct CalculationModel{
    private var accumulator: Double?
    private var secondAccumulator: Double?
    private var unaryAccumulator: Double?
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private enum Operation{
        case constant(Double)
        case unaryOperation((Double)->Double)
        case binaryOperation((Double,Double)->Double)
        case equals
    }

    private var operations: Dictionary<String, Operation> = [
        "π": Operation.constant(Double.pi),
        "e":Operation.constant(M_E),
        
        "√": Operation.unaryOperation(sqrt),
        "cos": Operation.unaryOperation(cos),
        "sin": Operation.unaryOperation(sin),
        "tan": Operation.unaryOperation(tan),
        "±": Operation.unaryOperation({ -$0 }),
        "x²":Operation.unaryOperation({ $0 * $0 }),
        "x³":Operation.unaryOperation({ $0 * $0 * $0 }),
        "⟦x⟧":Operation.unaryOperation(floor),
        "⟧x⟦":Operation.unaryOperation(ceil),
        
        
        "×": Operation.binaryOperation({ $0 * $1 }),
        "÷": Operation.binaryOperation({ $0 / $1 }),
        "+": Operation.binaryOperation({ $0 + $1 }),
        "−": Operation.binaryOperation({ $0 - $1 }),
        
        "=": Operation.equals,
    ]
    
    
    public mutating func setFirstOperand(_ operand: Double){
        accumulator = operand
        print("first operand: \(accumulator!)")
    }
    
    
    public mutating func setSecondOperand(_ secondOperand: Double){
        secondAccumulator = secondOperand
        print("second operand: \(secondAccumulator!)")
    }
    
    
    public mutating func performOperation(){
        if pendingBinaryOperation != nil && secondAccumulator != nil{
            accumulator = pendingBinaryOperation!.perform(with: secondAccumulator!)
        }
    }
    
    
    public mutating func setOperatorAndSaveFirstOperand(_ symbol: String){
        print("operator \(symbol)")
        if let operation = operations[symbol]{
            switch operation{
                
            case .constant(let value):
                accumulator = value
                
            case .unaryOperation(let function):
                if accumulator != nil{
                    unaryAccumulator = function(accumulator!)
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil{
                    pendingBinaryOperation = PendingBinaryOperation(function:function, firstOperand: accumulator!)
                }
            case .equals:
                break
            }
        }
        print("accu \(accumulator!)")
    }
    
    
    private struct PendingBinaryOperation{
        let function: (Double,Double)->Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double{
            return function(firstOperand, secondOperand)
        }
    }
    
    
    var result: Double? {
        mutating get{
            if let noNilResult = accumulator {
                accumulator =  Double(round(1000000000000 * noNilResult)/1000000000000)
            }
            return accumulator
        }
    }
    
    var unaryReslut: Double?{
        get{
           return unaryAccumulator
        }
    }
    
}

