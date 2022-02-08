//
//  Calculator.swift
//  Calculator
//
//  Created by Oreoluwa Lawal on 2022-02-07.
//

import Foundation

class Calculator{
    var stringNum : [String] = []
    var stringVal : String = ""

//    init(stringNum : [String], stringVal: String){
//        self.stringNum = stringNum;
//        self.stringVal = stringVal
//    }
    
    func push(value a : String) -> [String]{
        stringNum.append(a)
        
        return stringNum
    }

    func calculate(b : [String]) -> String{
        for i in b{
            stringVal += i
        }
        print(stringVal)

        let expression = NSExpression(format:stringVal)
        if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            print(result)
            return result.stringValue
        } else {
            print("error evaluating expression")
        }

        return ""
    }
}
