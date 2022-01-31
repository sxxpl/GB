import UIKit
import Foundation
import Darwin
//1.
struct Queue<T> {
    var items = [T]()
    
    var count:Int {
        return items.count
    }
    
    mutating func pushFirst(_ item:T){
        items.insert(item, at: 0)
    }
    
    mutating func popLast()->T{
        return items.removeLast()
    }
    
    func printQueue(){
        var str = ""
        for item in items {
            str+="\(item) "
        }
        print(str)
    }
}

//2.
extension Queue{
    func filter(function:(T)->Bool)->Queue<T>{
        var newItems = [T]()
        for item in items {
            if function(item){
                newItems.append(item)
            }
        }
        return Queue<T>(items: newItems)
    }
    
    func map(function:(T)->T)->Queue<T>{
        var newItems = [T]()
        for item in items {
            newItems.append(function(item))
        }
        return Queue<T>(items: newItems)
    }
    
    func reduce(_ enter:T,function:(T,T)->T)->T{
        var value = enter
        for item in items {
            value = function(value,item)
        }
        return value
    }
}
    

//3.
extension Queue {
    subscript(i: Int) -> T? {
        if i<0 || i>(count-1){
            return nil
        } else {
            return items[i]
        }
    }
}


var queue = Queue<Int>(items: Array(1...10))
queue.pushFirst(0)
queue.popLast()
queue.printQueue()
print(queue.count)
queue.filter(){$0 % 2==0}.printQueue()
queue.map(){$0*3}.printQueue()
print(queue.reduce(0){$0+$1})
print(queue[9])
print(queue[-5])
print(queue[30])
