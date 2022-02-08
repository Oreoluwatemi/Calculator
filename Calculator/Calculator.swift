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
    
    func isCalculatorValid(eqnArray a : [String]) -> Bool{
        for start in 0...a.count-1{
            if(start % 2 == 0){
                let x = a[start]
                if(x != "1" && x != "2" && x != "3" && x != "4" && x != "5" && x != "6" && x != "7" && x != "8" && x != "9"&&x != "0"){
                    return false;
                }
            }
            else if(start % 2 != 0){
                let x = a[start]
                if(x != "+" && x != "-" && x != "/" && x != "*" ){
                    return false;
                }
            }
        }
        return true;
    }
}
