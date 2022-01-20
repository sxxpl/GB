import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution=true

//добавил значения по умолчанию чтобы меньше структур создавать самому

struct SportCar {
    var mark:String = "BMW"
    var yearOfRelease:Int = 2000
    var trunkVolume:Int = 300
    var filledTrunkVolume:Int = 0
    var isEngineRunning:Bool = true
    var areWindowsOpen:Bool = false
    
    mutating func doAction(action:Action){
        switch action {
        case .startEngine:
            isEngineRunning = true
        case .stopEngine:
            isEngineRunning = false
        case .openWindows:
            areWindowsOpen = true
        case .closeWindows:
            areWindowsOpen = false
        case .loadIntoBody(let volume):
            if filledTrunkVolume+volume<=trunkVolume {
                filledTrunkVolume+=volume
            } else {
                print("Не хватает места!")
            }
        case .unloadFromBody(let volume):
            if filledTrunkVolume-volume>=0 {
                filledTrunkVolume+=volume
            } else {
                print("Невозможно выполнить операцию!")
            }
        }
    }
}

struct TrunkCar {
    var mark:String = "Volvo"
    var yearOfRelease:Int = 2005
    var trunkVolume:Int = 5000
    var filledTrunkVolume:Int = 3000
    var isEngineRunning:Bool = false
    var areWindowsOpen:Bool = true
    
    mutating func doAction(action:Action){
        switch action {
        case .startEngine:
            isEngineRunning = true
        case .stopEngine:
            isEngineRunning = false
        case .openWindows:
            areWindowsOpen = true
        case .closeWindows:
            areWindowsOpen = false
        case .loadIntoBody(let volume):
            if filledTrunkVolume+volume<=trunkVolume {
                filledTrunkVolume+=volume
            } else {
                print("Не хватает места!")
            }
        case .unloadFromBody(let volume):
            if filledTrunkVolume-volume>=0 {
                filledTrunkVolume+=volume
            } else {
                print("Невозможно выполнить операцию!")
            }
        }
    }
}

enum Action {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadIntoBody(volume:Int)
    case unloadFromBody(volume:Int)
}

var BMW = SportCar()
var Volvo = TrunkCar()
var Audi = SportCar(mark: "Audi", yearOfRelease: 2012, trunkVolume: 150, filledTrunkVolume: 50, isEngineRunning: false, areWindowsOpen: false)
var Kamaz = TrunkCar(mark: "Kamaz", yearOfRelease: 2010, trunkVolume: 3000, filledTrunkVolume: 2900, isEngineRunning: true, areWindowsOpen: false)


print(BMW.isEngineRunning)
BMW.doAction(action: Action.stopEngine)
print(BMW.isEngineRunning)
print(BMW.areWindowsOpen)
BMW.doAction(action: Action.openWindows)
print(BMW.areWindowsOpen)
print(Volvo.areWindowsOpen)
Volvo.doAction(action: Action.closeWindows)
print(Volvo.areWindowsOpen)
print(Volvo.isEngineRunning)
Volvo.doAction(action: Action.startEngine)
print(Volvo.isEngineRunning)
print(Audi.filledTrunkVolume)
Audi.doAction(action: Action.loadIntoBody(volume: 50))
print(Audi.filledTrunkVolume)
Audi.doAction(action: Action.unloadFromBody(volume: 300))
Kamaz.doAction(action: Action.loadIntoBody(volume: 150))

