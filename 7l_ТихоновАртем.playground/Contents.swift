import UIKit

enum mathError:Error{
    case zeroDiv
    case rootNegValue
}

class Mathh {
    func div(a:Double,b:Double) throws -> Double{
        guard b != 0 else{
            throw mathError.zeroDiv
        }
        return a/b
    }
    
    func root(a:Double,b:Double,c:Double) throws -> Double {
        let res = a*b-c
        guard res>=0 else {
            throw mathError.rootNegValue
        }
        return sqrt(res)
    }
}

var a = Mathh()
//1
if let res = try? a.div(a: 10, b: 0) {
    print("Результат деления \(res)")
}


//2
do{
    let res = try a.root(a: 2, b: 3, c: 3)
    print("Результат: \(res)")
} catch mathError.rootNegValue {
    print("Отрицательное значение в корне!")
}


